class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  # Changes to the importmap will invalidate the etag for HTML responses
  stale_when_importmap_changes

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  # ✅ Use this in any controller where you want to block actions behind login
  # Example: before_action :require_login, only: %i[new create edit update destroy]
  def require_login
    return if user_signed_in?

    store_location_for(:user, request.fullpath)
    redirect_to new_user_session_path, alert: "Login first — then we build better humans. 😄"
  end

  # ✅ Permit extra Devise fields
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name mobile_number])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name mobile_number])
  end
end