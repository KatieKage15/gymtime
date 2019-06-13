class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["onmiauth.auth"]
      client = Client.find_or_create_by_omniauth(auth_hash)
      session.delete :client_id

      redirect_to root_url
    else
      client = Client.find_by(:username => params[:username])
      if user && user.authenticate(params[:password])
        session.delete :client_id

        redirect_to root_url
      else
        render 'sessions/new'
      end
    end
  end

  def destroy
    if current_user
      session.delete :client_id
      redirect_to root_url
    end
  end

    private

  def auth
    request.env['omniauth.auth']
  end
end  
