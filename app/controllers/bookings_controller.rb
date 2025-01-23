class BookingsController < ApplicationController

  before_action :set_villa
  before_action :set_user


  def index
    @booking = Booking.all
  end

  def new
    # @villa = Villa.find(params[:villa_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.villa = @villa
    @booking.user = current_user
    @booking.confirmed = false if @booking.confirmed.nil?

    if @booking.save
      redirect_to dashboard_path, notice: "Booking request submitted successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])


    @booking.user = @user

    if @booking.update(booking_params)
      redirect_to dashboard_path, notice: "Booking updated successfully!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @booking = Booking.find(params[:id])

    @booking.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date )
  end

  def set_villa
    @villa = Villa.find(params[:villa_id])
  end

  def set_user
    @current_user = User.find(current_user.id)
    @user = @current_user
  end
end
