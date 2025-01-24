class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_villa, only: [:create, :destroy]

  def index
    @favourites = current_user.favourites.includes(:villa)
  end

  def create
    @favourite = Favourite.new(user: current_user, villa: @villa)

    if @favourite.save
      flash[:notice] = "Villa added to favourites successfully!"
    else
      flash[:alert] = "Failed to add villa to favourites."
    end

    redirect_to villas_path
  end

  def destroy
    @favourite = Favourite.find_by(user: current_user, villa: @villa)

    if @favourite&.destroy
      flash[:notice] = "Villa removed from favourites successfully!"
    else
      flash[:alert] = "Failed to remove villa from favourites."
    end

    redirect_to villas_path
  end

  private

  def find_villa
    @villa = Villa.find(params[:villa_id])
  end
end
