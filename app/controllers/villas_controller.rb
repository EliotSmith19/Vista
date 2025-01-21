class VillasController < ApplicationController
  def index
    @villas = Villa.all
  end

end
