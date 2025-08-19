class BookingsController < ApplicationController
  def new
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @lesson = Lesson.find(params[:lesson_id])
    @booking = Booking.new(booking_params)
    @booking.lesson = @lesson
    @booking.user = current_user
    authorize @booking
    if @booking.save
      redirect_to dashboard_path, notice: "Booking requested"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if @booking.update(booking_params)
      redirect_to trainer_bookings_path
    else
      render :edit, status: unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :participants, :status)
  end
end
