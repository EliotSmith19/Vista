class PagesController < ApplicationController

  def home
  end

  def dashboard
    @current_user = User.find(current_user.id)
    @my_bookings = @current_user.bookings
  end

end
