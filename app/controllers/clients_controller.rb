class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

   def index
     @client = Client.all
   end

  def show
    @client = current_client
  end

  def create
    client = Client.create(client_params)
    if client.save
      redirect_to client_path(client)
    else
      render :new
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to instructors_path
  end

  private

  def client_params
    params.require(:client).permit(:username, :email, :password_digest)
  end

  def client_signed_in
    params.require(:client).permit(:username, :password_digest)
  end
end
