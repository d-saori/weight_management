class GraphsController < ApplicationController
  # before_action :set_q, only: [:index, :search]

  def index
    # ransack検索用
    # @q = Graph.ransack(params[:q])
    # @graphs = @q.result(distinct: true).order(date: "DESC")
    # gon.graphs = @q.result(distinct: true).order(date: "DESC")

    # DBにある体重データをJavascriptに渡す
    gon.weight_records = Graph.chart_data(current_user)
    # 記録済みの日付データ
    gon.recorded_dates = current_user.graphs.map(&:date)
  end

  # def search
  #   @q = Graph.search(params_graph_search)
  #   @graphs = @q.result(distinct: true).order(date: "DESC")
    # gon.graphs = @q.result(distinct: true).order(date: "DESC")
  # end

  def show
    # @graphs = User.find(params[:id])
  end

  def create
    @graph = current_user.graphs.build(graph_params)
    date = @graph.date.strftime('%Y/%-m/%-d')
    if @graph.save
      flash[:notice] = "#{date}の記録を追加しました"
    else
      flash[:alert] = 'エラーが発生しました'
    end
    redirect_to graphs_path
  end

  def update
    # 削除ボタンに name 属性を入れたので、削除ボタンを押したときだけ params[:_destroy] が存在する状態となる
    @graph = current_user.graphs.find_by(date: params[:graph][:date])
    date = @graph.date.strftime('%Y/%-m/%-d')
    if @graph.nil?
      flash[:alert] = 'エラーが発生しました'
    elsif params[:_destroy].nil? && @graph.update(graph_params)
      flash[:notice] = "#{date}の記録を修正しました。"
    elsif params[:_destroy].present? && @graph.destroy
      flash[:alert] = "#{date}の記録を削除しました。"
    else
      flash[:alert] = 'エラーが発生しました'
    end
    redirect_to graphs_path
  end

  private

    def graph_params
      params.require(:graph).permit(:date, :weight)
    end

    # def params_graph_search
    #   params.permit(:weight_gt)
    # end
end
