class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Before actions to check for logged-in users
  before_action :check_logged_in, except: [ :show ]

  # Set global page metadata
  before_action :set_meta

  private

  # Check if the user is logged in
  # Redirect to login page if not logged in
  def check_logged_in
    redirect_to login_path, alert: "You must be logged in to access this section" unless user_signed_in?
  end

  # Method to check if a user is signed in
  # This is a placeholder; actual implementation will depend on your authentication setup
  def user_signed_in?
    # Normally, this would interact with session or devise helper methods
    session[:user_id].present?
  end

  # Set basic metadata for SEO
  def set_meta
    @page_title = "AI Insight Blog"
    @meta_description = "Explore AI-driven insights and discussions on cutting-edge technologies."
  end

  # Example of a method that can be used to configure timezone or locale
  def set_timezone
    Time.zone = current_user.timezone if user_signed_in?
  end

  # Handles user not found with a more graceful rescue
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  protected

  # A protected method for when a record is not found
  def record_not_found
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
