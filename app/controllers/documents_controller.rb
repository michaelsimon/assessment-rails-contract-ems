class DocumentsController < ApplicationController
  before_action :get_document, only: [:show, :edit, :update, :destroy]

  def new
    authorize @contract = Contract.find(params[:contract_id])
    authorize @document = Document.new
  end

  def create
    authorize @document = Document.new(document_params)
    puts @document.inspect
    if @document.save
      render json: @document, status: 201
    else
      # @contract = Contract.find(params[:contract_id])
      # render 'new'
      render status: 400
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

  # def index
  # end

  def destroy
    authorize @document.delete if @document
    redirect_to contract_path(@document.contract)
  end

  private
  def get_document
    authorize @document = Document.find_by(id: params[:id], contract_id: params[:contract_id])
    @contract = @document.contract
  end

  def document_params
    params.require(:document).permit(:contract_id, :name, :description, :location)
  end
end
