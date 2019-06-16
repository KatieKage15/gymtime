module ClientsHelper

  def current_client
    if session[:client_id].present?
      client = Client.find_by(:id => session[:user_id])
    end
  end
  
end
