class VillasController < ApplicationController
  before_action :set_villa, only: [:show]
  def index
    @villas = Villa.all
  end

  def show

  end

  private
  def set_villa
    @villa = Villa.find(params[:id])
  end

end
