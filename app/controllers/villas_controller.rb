class VillasController < ApplicationController

  before_action :authenticate_user!
  before_action :set_villa, only: [:show]
  
  def index
    @villas = Villa.all
  end
  
  def show

  end
  
  def new
    @villa = Villa.new
  end

  def create
    @villa = current_user.villas.build(villa_params)

    if @villa.save
      redirect_to dashboard_path, notice: "Villa listing created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def villa_params
    params.require(:villa).permit(:villa_name, :villa_location, :description, :price, :img_url, :rating )
  end
    
  def set_villa
    @villa = Villa.find(params[:id])
  end
end
