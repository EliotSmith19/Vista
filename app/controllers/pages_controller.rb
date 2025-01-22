class PagesController < ApplicationController
  def home
    @villas = Villa.all
  end
end
