class VillasController < ApplicationController
  def index
    @villas = Villa.all
  end

  def show
    @villa = Villa.find(params[:id])
  end

end
