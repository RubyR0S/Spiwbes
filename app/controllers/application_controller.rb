class ApplicationController < ActionController::Base

  private
  
  def current_admin
    @current_admin ||= Admin.find_by(id: session[:admin_id]) if session[:admin_id].present? 
  end

  def admin_signed_in?
    current_admin.present?
  end

  helper_method :current_admin, :admin_signed_in?
end
