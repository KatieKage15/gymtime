class TrainingsController < ApplicationController
  before_action :require_login

  def create
    training = Training.create(client_id: current_user.id, instructor_id: params[:instructor_id])
    if training
      response = training.book_training
      flash[:notice] = response
      redirect_to client_path(training.client)
    else
      redirect_to instructor_path(training.instructor)
    end
  end
end
