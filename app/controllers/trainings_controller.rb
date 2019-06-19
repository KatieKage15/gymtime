class TrainingsController < ApplicationController
  before_action :require_login

  def index
    @training = Training.all
  end

  def new
    @training = Training.new
    redirect_to new_training_path
  end

  def edit
    @training = Training.find_by(id: params[:id])
    @specialties = Specialty.sorted_specialty
    @available = @training.available_specialty.build
  end

  def create
    @training = Training.new(training_params)
    @training.client_id = current_client.id
    if @training.save
      redirect_to client_training_path(current_client, @training)
    else
      render :new
    end
  end

  def show
    @training = Training.find_by(id: params[:id])
  end

  private

    def pantry_params
      params.require(:training).permit(:name)
    end
end
