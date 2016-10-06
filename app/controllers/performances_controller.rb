class PerformancesController < ApplicationController
  before_action :get_performance, only: [:show, :edit, :update, :destroy, :performance_detail]

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

  def performance_detail
    if @performance
      render json: @performance, serializer: PerformanceDetailSerializer, status: 201
    else
      render status: 400
    end
  end

  def performances_listing
    authorize @performances = policy_scope(Performance).order(perf_date: :desc)

    if params[:type] == "home"
      @performances = @performances
    elsif params[:type] == "venue"
      @performances = @performances.where('venue_id = ?', params[:id])
    elsif params[:type] == "act"
      @performances = @performances.where('act_id = ?', params[:id])
    end

    if @performances
      render json: @performances, each_serializer: PerformanceListSerializer, status: 201
    else
      render status: 400
    end
  end

  def index
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
