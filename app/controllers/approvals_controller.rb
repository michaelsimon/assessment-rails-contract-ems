class VenuesController < ApplicationController
  before_action :get_approval, only: [:show, :edit, :update, :destroy]

  def new
    #code
  end

  def create
    #code
  end

  def edit
    #code
  end

  def update
    #code
  end

  def show
    #code
  end

  def index
    #code
  end

  def destroy
    #code
  end

  private
  def get_approval
    @approval = Approval.find(params[:id])
  end
end
