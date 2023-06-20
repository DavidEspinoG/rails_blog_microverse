class ApplicationController < ActionController::Base
  before_action :update_allowed_parameters, if: :devise_controller?
  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) {
      |u| u.permit(:posts_counter, :name, :email, :password)
    }
  end
end
