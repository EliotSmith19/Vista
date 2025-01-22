class PagesController < ApplicationController
  def home
  end

  def dashboard
    @villas = current_user.villas

    @current_user = User.find(current_user.id)
    @my_bookings = @current_user.bookings

  end

end
