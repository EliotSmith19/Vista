class VillasController < ApplicationController
  before_action :authenticate_user!
  before_action :set_villa, only: [:show, :destroy]
  before_action :set_user

  def index
    @villas = Villa.all
  end

  def show
    @villa = Villa.find(params[:id])
    @user = User.find(@villa.user_id)
    @villa.user = @user
  end

  def new
    @villa = Villa.new
  end

  def create
    @villa = current_user.villas.build(villa_params)
    @villa.user = current_user
    if @villa.save
      redirect_to villas_path, notice: "Villa listing created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    if @villa.user == current_user
      @villa.destroy
      redirect_to dashboard_path, notice: "Villa was successfully deleted."
    else
      redirect_to dashboard_path, alert: "You are not authorized to delete this villa."
    end
  end


  private

  def villa_params
    params.require(:villa).permit(:villa_name, :villa_location, :description, :price, :img_url, :rating )
  end

  def set_villa
    # @villa = current_user.villas.find(params[:id])
    @villa = Villa.find(params[:id])
  end

  def set_user
    # @user = User.find(params[:user_id])
    @user = current_user
  end
end
