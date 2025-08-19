class LessonsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show, :classes ]

  def index
    @lessons = policy_scope(Lesson)
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

    authorize @lesson

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
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    authorize @lesson
    if @lesson.save
      redirect_to trainer_bookings_path, notice: "Lesson made!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @lesson.photos.each(&:purge_later) if @lesson.respond_to?(:photos)
    @lesson.destroy
    redirect_to lessons_path, notice: "Lesson deleted.", status: :see_other
  end

  private

  def lesson_params
    params.require(:lesson).permit(:title, :description, :duration, :address, :price, :capacity, :category, photos: [])
  end

end
