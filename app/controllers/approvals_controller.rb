class ApprovalsController < ApplicationController
  before_action :get_approval, only: [:show, :edit, :update, :destroy]

  def update
    #code
  end

  def show
    #code
  end

  def destroy
    #code
  end

  private
  def get_approval
    @approval = Approval.find(params[:id])
  end

  def approval_params
    params.require(:approval).permit(:contract_id, :user_id, :date_requested, :date_answered, :status)
  end

end
