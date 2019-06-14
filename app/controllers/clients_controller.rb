class ClientsController < ApplicationController

  def show
    @client = Client.find_by(:id => params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.create(client_params)
    if @client.valid?
        redirect_to instructor_path(@instrucors)
    else
      render :new
    end
  end

  private

  def client_params
    params.require(:client).permit(:username, :email, :password_digest)
  end
end
