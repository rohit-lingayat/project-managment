# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # Catch all CanCan errors and alert the user of the exception
  rescue_from CanCan::AccessDenied do | exception|
    redirect_to root_url, alert: exception.message
  end

  protected

  def after_sign_in_path_for(_resource)
    root_path
  end

  def after_sign_out_path_for(_resource)
    new_user_session_path
  end
end
