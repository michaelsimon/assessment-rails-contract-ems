class PerformancesController < ApplicationController
  before_action :get_performance, only: [:show, :edit, :update, :destroy]

  def new
    authorize @performance = Performance.new
  end

  def create
    authorize @performance = Performance.new(performance_params)
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
    authorize @performances_upcoming = policy_scope(Performance).order(perf_date: :asc).where('perf_date >= ?', Date.today)
    authorize @performances_past = policy_scope(Performance).order(perf_date: :asc).where('perf_date < ?', Date.today)
  end

  def destroy
    @performance.delete if @performance
    redirect_to performances_path
  end

  private
  def get_performance
    authorize @performance = Performance.find(params[:id])
  end

  def performance_params
    params.require(:performance).permit(:act_id, :venue_id, :name, :perf_date, :perf_time, :tkts_url, :description)
  end
end
