class ActsController < ApplicationController
  before_action :get_act, only: [:show, :edit, :update, :destroy]
  def new
    authorize @act = Act.new
  end

  def create
    authorize @act = Act.new(act_params)
    if @act.save
      redirect_to @act
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @act.update(act_params)
      redirect_to @act
    else
      render 'edit'
    end
  end

  def show
    @performances_upcoming = policy_scope(Performance).order(perf_date: :asc).where('perf_date >= ? and act_id = ?', Date.today, @act.id)
    @performances_past = policy_scope(Performance).order(perf_date: :asc).where('perf_date < ? and act_id = ?', Date.today, @act.id)
  end

  def index
    authorize @acts = policy_scope(Act)
  end

  def destroy
    @act.delete if @act
    redirect_to acts_path
  end

  private
  def get_act
    authorize @act = Act.find(params[:id])
  end

  def act_params
    params.require(:act).permit(:name, :description, :location, :size, :website)
  end
end
