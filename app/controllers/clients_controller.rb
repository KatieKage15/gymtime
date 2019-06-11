class ClientsController < ApplicationController
  before_action :require_login

  def show
    @client = Client.find_by(:id => params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.valid?
        session[:client_id] = client.id
        redirect_to client_path(@client)
    else
      render :new
    end
  end

  private

  def client_params
    params.permit(:username, :email, :password_digest)
  end


end
