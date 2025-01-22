class BookingsController < ApplicationController

  before_action :set_villa
  before_action :set_user


  def index
    @booking = Booking.all
  end

  def new
    @villa = Villa.find(params[:villa_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.villa = @villa
    @booking.user = @user
    @booking.confirmed = false if @booking.confirmed.nil?

    if @booking.save
      redirect_to dashboard_index_path, notice: "Booking request submitted successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date )
  end

  def set_villa
    @villa = Villa.find(params[:villa_id])
  end

  def set_user
    @user = @villa.user
  end
end
