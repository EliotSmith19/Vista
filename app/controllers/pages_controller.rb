class PagesController < ApplicationController
  def home
  end

  def dashboard
    @villas = current_user.villas
    @current_user = User.find(current_user.id)
    @my_bookings = @current_user.bookings
    @booking_requests = current_user.booking_requests
  end

  def profile
    @current_user = User.find(current_user.id)
    @villas = @current_user.villas
    @my_bookings = @current_user.bookings
  end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.destroy
  #   redirect_to dashboard_path, status: :see_other
  # end

  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.villa = @villa
  #   @booking.destroy
  #   redirect_to  dashboard_path, status: :see_other
  # end

  def destroy
    @booking_request = Booking.find(params[:id])
    @booking_request.destroy
    redirect_to dashboard_path, status: :see_other, notice: 'Booking was successfully deleted.'
  end
  # def destroy
  #   @booking_request = Booking.find(params[:id])

  #   @booking.destroy
  #   redirect_to dashboard_path, status: :see_other
  # end


end
