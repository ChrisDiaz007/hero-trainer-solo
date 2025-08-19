class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized,
               unless: :skip_pundit?,
               if: -> { action_name != "index" }

  after_action :verify_policy_scoped,
               unless: :skip_pundit?,
               if: -> { action_name == "index" }

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :bio, :experience, :specialties, :photo])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :bio, :experience, :specialties, :photo])
  end

  private

  def skip_pundit?
    devise_controller? ||
      params[:controller].start_with?("rails_", "active_storage/", "pages")
  end
end
