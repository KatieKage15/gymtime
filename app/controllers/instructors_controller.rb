class InstructorsController < ApplicationController
  before_action :find_instructor, only: [:show, :edit, :update]

  def index
    Instructor.certified
  end

  def new
    @instructor = Instructor.new

  def show
    @instructor = Instructor.find(params[:instructor_id])
  end

  def create
    @instructor = Instructor.create(instructor_params)
    if @instructor
      redirect_to instructor_path(@instructor)
    else
      render :new
    end
  end

  def update
    @instructor = Instructor.find(params[:id])
  end

private
  def find_instructor
    @instructor = Instructor.find_by(id: params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name, :gym, :specialty)
  end
end
