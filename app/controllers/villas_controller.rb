class VillasController < ApplicationController
  before_action :authenticate_user!

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
    params.require(:villa).permit(:villa_name, :villa_location, :description, :price, :photo)
  end
end
