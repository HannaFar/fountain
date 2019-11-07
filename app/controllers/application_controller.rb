class ApplicationController < ActionController::Base
protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?
# Redirect to jobs pages when user signed in
  def after_sign_in_path_for(resource)
    jobs_path
  end

  # Redirect to root path if user has not signed in
  protected
  def authenticate_user!
    redirect_to root_path, notice: "You must login" unless (employer_signed_in? || candidate_signed_in?)
  end

  def redirect_user
    redirect_to jobs_path unless !(current_employer || current_candidate)
  end



protected

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
end

end
