class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @lessons = Lesson.all
    if params[:query].present?
      @lessons = Lesson.search_by_title_and_category(params[:query])
    end
    @markers = @lessons.geocoded.map do |lesson|
      {
        lat: lesson.latitude,
        lng: lesson.longitude
      }
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    @trainer = @lesson.user

  @markers =
    if @lesson.geocoded?
      [{
        lat: @lesson.latitude,
        lng: @lesson.longitude
      }]
    else
      []
    end

  end

  def classes
    @classes = Lesson.all
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    if @lesson.save
      redirect_to trainer_bookings_path, notice: "Lesson made!"
    else
      render :new, status: :unprocessable_entity
    end

  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :duration, :address, :price, :capacity)
  end

end
