class InstructorsController < ApplicationController

  def index
    Instructor.certified
  end

  def show
    @instructor = Instructor.find(params[:instructor_id])
  end

  def create
    @instructor = Instructor.create(client_id: instructor_id)
  end

  def update
    @instructor = Instructor.find(params[:id])
  end
end
