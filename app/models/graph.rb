class Graph < ApplicationRecord
  belongs_to :user

  VALID_DATA_REGEX = /\A[a-z0-9]+\z/i
  # 一人のユーザーが同じ日付のデータを複数記録できないようにする
  validates :date, presence: true, uniqueness: { scope: :user_id }
  validates :weight, presence: true, format: { with: VALID_DATA_REGEX }

  def self.chart_data(user)
    # そのままデータを取り出すと日付が不連続なデータになる為、日付の連続したデータを作成(asc:昇順)
    graphs = user.graphs.order(date: :asc)
    # 記録が無い場合にエラーが出るのを防止
    return [{ date: Date.today, weight: nil }] if graphs.empty?

    # 記録の初日から最終日までの配列データを作成
    period = graphs[0].date..graphs[-1].date
    index = 0
    period.map { |date|
      if graphs[index].date == date
        weight = graphs[index].weight
        index += 1
      end
      # データが存在しない日付の体重はnilとする
      { date: date, weight: weight }
    }
  end
end
