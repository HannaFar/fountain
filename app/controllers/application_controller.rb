class ApplicationController < ActionController::Base

# Redirect to jobs pages when user signed in
  def after_sign_in_path_for(resource)
    jobs_path
  end

  # Redirect to root path if user has not signed in
  protected
  def authenticate_user!
    redirect_to root_path, notice: "You must login" unless (employer_signed_in? || candidate_signed_in?)
  end

end
