class ApprovalsController < ApplicationController
  before_action :get_approval, only: [:approve, :cancel, :destroy]

  def approve
    if @approval && (@approval.user_id == current_user.id || current_user.is_admin)
      @approval.mark_approved
      redirect_to contract_path(@approval.contract_id)
    else
      redirect_to :back
    end
  end

  def cancel
    if @approval && current_user.role = 'super_admin')
      @approval.mark_cancelled
      redirect_to contract_path(@approval.contract_id)
    else
      redirect_to :back
    end
  end

  def destroy
    @approval.delete if @approval
    redirect_to contract_path(@approval.contract)
  end

  private
  def get_approval
    authorize @approval = Approval.find_by(id: params[:id])
  end

  # def approval_params
  #   params.require(:approval).permit(:contract_id, :user_id, :date_requested, :date_answered, :status)
  # end

end
