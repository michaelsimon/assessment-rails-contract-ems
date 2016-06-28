class ApprovalsController < ApplicationController
  before_action :get_approval, only: [:approve, :cancel, :reject, :destroy]

  def approve
    if @approval && (@approval.user_id == current_user.id || current_user.is_admin)
      @approval.mark_approved
      redirect_to contract_path(@approval.contract_id)
    else
      redirect_to :back
    end
  end

  def reject
    if @approval && (@approval.user_id == current_user.id)
      @approval.mark_rejected
      redirect_to contract_path(@approval.contract_id)
    else
      redirect_to :back
    end
  end

  def cancel
    if @approval && current_user.is_admin
      @approval.mark_cancelled
      redirect_to contract_path(@approval.contract_id)
    else
      redirect_to :back
    end
  end

  private
  def get_approval
    authorize @approval = Approval.find_by(id: params[:id])
  end
end
