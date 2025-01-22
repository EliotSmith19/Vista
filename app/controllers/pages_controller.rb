class PagesController < ApplicationController
  def home
  end

  def dashboard
    @villas = current_user.villas
  end

end
