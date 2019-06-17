class TrainingsController < ApplicationController
  before_action :require_login

    def new
      @training = Training.new
    end

    def edit
      @training = Training.find_by(id: params[:id])
      @required = @training.required_daytime.build
    end

    def create
      @training = Training.new(training_params)
      if @training.save
        redirect_to training_path(@rtraining)
      else
        render :new
      end
    end

    def show
      @training = Training.find_by(id: params[:id])
    end

    private

      def training_params
        params.require(:training).permit(:name, :daytime)
      end
