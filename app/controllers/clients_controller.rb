class ClientsController < ApplicationController

  def new
    @client = Client.new
  end

  # def index
  #   @client = Client.all
  # end

  def show
    @client = Client.find_by(id: session[:client_id])
    if @client.trainings.empty?
      redirect_to new_training_path(@client)
    end
    @trainings = @client.trainings
  end

  def create
    if params[:client][:password_digest] == params[:client][:password_confirmation]
      @client = Client.new(client_params)
      if @client.save
        session[:client_id] = @client.id
        redirect_to @client
      else
        render :new
      end
    end
  end

  private

  def client_params
    params.require(:client).permit(:username, :email, :password_digest)
  end

  def client_signed_in
    params.require(:client).permit(:username, :password_digest)
  end
end
