class ClientsController < ApplicationController
  before_action :require_login, except: [:new, :create]

    def new
      @client = Client.new
    end

    def create
      if params[:client][:password] == params[:client][:password_confirmation]
        @client = Client.new(client_params)
        if @client.save
          session[:client_id] = @client.id
          redirect_to @client
        else
          render :new
        end
      end
    end

    def show
      @client = Client.find_by(id: session[:client_id])
      if @client.trainings.empty?
        redirect_to new_client_training_path(@client)
      end
      @trainings = @client.trainings
    end

    private
      def client_params
        params.require(:client).permit(:username, :email, :password)
      end
  end
