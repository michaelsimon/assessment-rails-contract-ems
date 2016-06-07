class VenuesController < ApplicationController
  before_action :get_venue, only: [:show, :edit, :update, :destroy]

  def new
    authorize @venue = Venue.new
  end

  def create
    authorize @venue = Venue.new(venue_params)
    if @venue.save
      redirect_to @venue
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @venue.update(venue_params)
      redirect_to @venue
    else
      render 'edit'
    end
  end

  def show
    @users = @venue.users
  end

  def index
    authorize @venues = policy_scope(Venue)
  end

  def destroy
    @venue.delete if @venue
    redirect_to venues_path
  end

  private
  def get_venue
    authorize @venue = Venue.find(params[:id])
  end

  def venue_params
    params.require(:venue).permit(:name, :address, :city, :state, :zipcode, :phone, :email, :website)
  end

end
