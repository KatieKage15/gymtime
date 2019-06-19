class ClientsController < ApplicationController
  before_action :require_login, except: [:new, :create]

    def new
      @client = Client.new
    end

    def index
      @users = User.all
    end

    def edit
    end

    def create
    @client = Client.new(email: params[:client][:email], password: SecureRandom.hex, username: params[:client][:username])
      if @client.save
        session[:client_id] = @client.id
        flash[:success] = 'Account created'
        redirect_to @client
      else
        flash[:notice] ='ERROR: Account was not created'
        render :new
      end
    end

    def show
      @client = Client.find_by(id: session[:client_id])
    end

    def update
      @client.update(client_params)
      if @client.save
        redirect_to client_path(@client)
      else
        render :edit
      end
    end

    def destroy
      if current_client
        session.delete :client_id
        redirect_to client_path
      end
    end

    private
      def client_params
        params.require(:client).permit(:id, :username, :email, :password_digest)
      end
  end
