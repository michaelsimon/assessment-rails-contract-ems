class DocumentsController < ApplicationController
  before_action :get_document, only: [:show, :edit, :update, :destroy]

  def new
    @contract = Contract.find(params[:contract_id])
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to contract_path(@document.contract_id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @document.update(document_params)
      redirect_to contract_path(@document.contract_id)
    else
      render 'edit'
    end
  end

  def show
    redirect_to @document.location
  end

  def index
    @contracts = Document.where(contract_id: params[:contract_id])
  end

  def destroy
    @document.delete if @document
    redirect_to contract_path(@document.contract)
  end

  private
  def get_document
    @document = Document.find(params[:id])
    @contract = @document.contract
  end

  def document_params
    params.require(:document).permit(:contract_id, :name, :description, :location)
  end
end
