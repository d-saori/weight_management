document.addEventListener('turbolinks:load', () => {
    // '2021-04-06'のような文字列から、Javascriptの日付オブジェクトを取得する関数
    // setHoursを使用しないと、時差の影響で0時にならないため注意！
    const convertDate = (date) => new Date(new Date(date).setHours(0, 0, 0, 0))

    const TODAY = convertDate(new Date())
    const A_WEEK_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth(), TODAY.getDate() - 6)
    const TWO_WEEKS_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth(), TODAY.getDate() - 13)
    const A_MONTH_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 1, TODAY.getDate() + 1)
    const THREE_MONTHS_AGO = new Date(TODAY.getFullYear(), TODAY.getMonth() - 3, TODAY.getDate() + 1)

    // グラフを描く場所を取得
    const chartWeightContext = document.getElementById("chart-weight").getContext('2d')
    // 関数内で変数宣言をするとローカル変数となり、関数の外で消えてしまう
    // drawGraph 関数の外で変数宣言をしなければならない!
    let chartWeight

    // 期間を指定してグラフを描く
    const drawGraph = (from, to) => {
        // from から to までの期間のデータに絞る
        let records = gon.weight_records.filter((record) => {
            let date = convertDate(record.date)
            return from <= date && date <= to
        })

        // 日付のみのデータを作成
        let dates = records.map((record) => {
            // 横軸のラベル表示は簡潔にしたいので
            // 日付 2021-04-06 を 4/6 のような形式に変換する
            return record.date.replace(/^\d+-0*(\d+)-0*(\d+)$/, '$1/$2')
        })

        // 体重のみのデータを作成
        let weights = records.map((record) => record.weight)

        let weightData = {
            labels: dates,
            datasets: [{
                label: '体重(kg)',
                data: weights,
                backgroundColor: 'rgba(255, 99, 132, 0.2)',
                borderColor: 'rgba(255, 99, 132, 1)',
                borderWidth: 1,
                spanGaps: true
            }]
        }

        let weightOption = {
            tooltips: {
                callbacks: {
                    // ホバー（スマホならタップ）時のラベル表示を変更
                    title: function (tooltipItems) {
                        return tooltipItems[0].xLabel.replace(/^(\d+).(\d+)$/, ' $1 月 $2 日')
                    },
                    label: function (tooltipItem) {
                        return '体重: ' + tooltipItem.yLabel + 'kg'
                    }
                }
            }
        }

        if (!chartWeight) {
            // グラフが存在しないときは作成する
            chartWeight = new Chart(chartWeightContext, {
                type: 'line',
                data: weightData,
                options: weightOption
            })
        } else {
            // グラフが存在するときは更新する
            chartWeight.data = weightData
            chartWeight.options = weightOption
            chartWeight.update()
        }
    }

    // グラフの初期表示(当日から一週間前に指定)
    drawGraph(A_WEEK_AGO, TODAY)
})