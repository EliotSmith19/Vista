class VillasController < ApplicationController
  def new
    @villa = Villa.new
  end

  def create
    @villa = Villa.new(villa_params)
    if @villa.save
      redirect_to dashboard_path, notice: "Property created successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def villa_params
    params.require(:villa).permit(:villa_name, :villa_location, :description, :price, :img_url, :rating )
  end
end
