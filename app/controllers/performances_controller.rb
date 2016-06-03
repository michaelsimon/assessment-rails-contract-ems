class PerformancesController < ApplicationController
  before_action :get_performance, only: [:show, :edit, :update, :destroy]

  def new
    @performance = Performance.new
  end

  def create
    @performance = Act.new(performance_params)
    if @performance.save
      redirect_to @performance
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @performance.update(performance_params)
      redirect_to @performance
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @performances = Performance.all
  end

  def destroy
    #code
  end

  private
  def get_performance
    @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:act_id, :venue_id, :name, :perf_date, :perf_time, :tkts_url, :description)
  end
end
