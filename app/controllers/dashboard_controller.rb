class DashboardController < ApplicationController
  skip_after_action :verify_authorized, only: :dashboard

  def dashboard
    @bookings = Booking.where(user: current_user.id)
  end
end
