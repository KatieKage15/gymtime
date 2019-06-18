module ApplicationHelper

  def current_client
    @client = (Client.find_by(id: session[:client_id]) || Client.new)
  end

  def signed_in?
    current_client != nil
  end

  def require_signed_in
    return redirect_to signin_url unless session[:client_id]
  end

  def is_current_client?
    return redirect_to training_path(current_client.training) unless current_client == Client.find_by(id: params[:id])
  end

  def is_admin?
    current_client.admin
  end

  def flash_class(level)
    case level
        when :notice then "alert alert-info"
        when :success then "alert alert-success"
        when :error then "alert alert-error"
        when :alert then "alert alert-error"
    end
  end
end
