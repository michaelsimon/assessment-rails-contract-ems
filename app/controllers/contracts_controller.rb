class ContractsController < ApplicationController
  before_action :get_contract, only: [:show, :edit, :update, :destroy]

  def new
    @contract = Contract.new
  end

  def create
    @contract = Contract.new(contract_params)
    if @contract.save
      redirect_to @contract
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    raise
    if @contract.update(contract_params)
      redirect_to @contract
    else
      render 'edit'
    end
  end

  def show
    @users = User.all
  end

  def index
    @contracts = Contract.all
  end

  def destroy
    #code
  end

  private
  def get_contract
    @contract = Contract.find(params[:id])
  end

  def contract_params
    params.require(:contract).permit(:performance_id, :submit_date, :due_date, :status, :details, approvals_attributes: [:contract_id, :user_id, :date_requested, :date_answered, :status])
  end
end
