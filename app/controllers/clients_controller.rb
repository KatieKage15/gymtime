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
    @client = Client.create(client_params)
    if @client.valid?
        redirect_to instructor_path(instructor)
    else
      render :new
    end
  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to instructor_path
  end

  private

  def client_params
    params.require(:client).permit(:username, :email, :password_digest)
  end
end
