class ActsController < ApplicationController
  before_action :get_act, only: [:show, :edit, :update, :destroy]

  def new
    @act = Act.new
  end

  def create
    @act = Act.new(act_params)
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
  end

  def index
    @acts = Act.all
  end

  def destroy
    #code
  end

  private
  def get_act
    @act = Act.find(params[:id])
  end

  def act_params
    params.require(:act).permit(:name, :description, :location, :size, :website)
  end
end
