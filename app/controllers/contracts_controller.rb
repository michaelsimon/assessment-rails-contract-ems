class ContractsController < ApplicationController
  before_action :get_contract, only: [:show, :edit, :update, :destroy]

  def new
    authorize @contract = Contract.new
  end

  def create
    authorize @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @contract.update(contract_params)
      redirect_to @contract
    else
      render 'edit'
    end
  end

  def show
    @approvals = Approval.where(contract_id: @contract.id)
    @documents = Document.where(contract_id: @contract.id)
  end

  def index
    authorize @contracts = policy_scope(Contract).order(due_date: :asc)
  end

  def destroy
    @contract.delete if @contract
    redirect_to contracts_path
  end

  private
  def get_contract
    authorize @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:performance_id, :submit_date, :due_date, :status, :details, approvals_attributes: [:contract_id, :user_id, :date_requested, :date_answered, :status])
  end
end
