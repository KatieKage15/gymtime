class SessionsController < ApplicationController

  def new
  end

  def create
    if auth_hash = request.env["onmiauth.auth"]
      oauth_email = request.env["onmiauth.auth"]["username"]

      if client = Client.find_by(:username => params[:username])
        raise "EXISTING CLIENT LOGGIN IN VIA GITHUB".inspect
        session[:client_id] = client.id
        redirect_to root_url
      else
        client = Client.new(:username => oauth_email, password => SecureRandsom.hex)
        if client.save
          session[:client_id] = client.id
          redirect_to root_url
        else
          raise client.errors.full_messages.inspect
        end
      end
    else
      #normal login
      client = Client.find_by(:username => params[:username])
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
