class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_client, :require_login


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
