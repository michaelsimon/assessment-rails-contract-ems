class UsersController < ApplicationController
  before_action :get_user, only: [:edit, :update, :destroy]
  def index
    @users = User.all
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user.delete if @user
    redirect_to users_path
  end

  private
  def get_user
    authorize @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :title, :phone, :email, :role, :act_id, :venue_id, :approved)
  end
end
