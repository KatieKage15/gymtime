class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_client, :require_login, :admin_only

  def admin_only
    unless current_client.admin
      flash[:notice] = "You must be an admin to perform that function!"
      redirect_to client_path(current_client)
    end
  end

  def welcome
  end

  def current_client
    if session[:client_id].present?
      client = Client.find_by(:id => session[:client_id])
    end
  end

  def require_login
    unless current_client
      redirect_to root_url
    end
  end
end
