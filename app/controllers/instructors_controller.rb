class InstructorsController < ApplicationController
  before_action :find_instructor, only: [:show, :edit, :update]
  before_action :require_login

  def index
    @instructor = Instructor.all
  end

  def new
    @instructor = Instructor.new
  end

  def show
    @instructor = Instructor.find(params[:id])
  end

  def edit
    @instructor = Instructor.find(params[:id])
  end

  def create
    @instructor = Instructor.create(instructor_params)
    if @instructor.save
      redirect_to @instructor
    else
      render :new
    end
  end

  def update
    @instructor.update(instructor_params)
    if @instructor.save
      redirect_to instructors_path(@instructor)
    else
      render :edit
    end
  end

  def destroy
    @instructor = Instructor.find(params[:id])
    @instructor.destroy
    redirect_to instructors_path
  end

  private

  def find_instructor
    @instructor = Instructor.find_by(id: params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name, :gym, :specialty)
  end
end
