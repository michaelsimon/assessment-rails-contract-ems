class ApprovalsController < ApplicationController
  before_action :get_approval, only: [:approve, :cancel, :reject, :destroy]

  def approve
    if @approval && (@approval.user_id == current_user.id || current_user.is_admin)
      if @approval.mark_approved
        render json: @approval, status: 201
      else
        render status: 400
      end
    else
      render status: 401
    end
  end

  def reject
    if @approval && (@approval.user_id == current_user.id)
      if @approval.mark_rejected
        render json: @approval, status: 201
      else
        render status: 400
      end
    else
      render status: 401
    end
  end

  def cancel
    if @approval && current_user.is_admin
      if @approval.mark_cancelled
        render json: @approval, status: 201
      else
        render status: 400
      end
    else
      render status: 401
    end
  end


  def pending_approval
    authorize @approvals = Approval.pending_approval
  end

  private
  def get_approval
    authorize @approval = Approval.find_by(id: params[:id])
  end
end
