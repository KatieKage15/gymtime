class ClientsController < ApplicationController
  before_action :require_login

  def show
    @client = Client.find(params[:id])
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)

    if @client.save
        redirect_to client_path(@client)
    else
      render :new
    end
  end

  def edit
      @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
        redirect_to client_path(@client)
    else
      render :edit
    end
  end

  private

  def client_params
    params.permit(:usernam, :email, :password_digest)
  end

  def require_login
    return head(:forbidden) unless session.include? :instructor_id
  end
end
