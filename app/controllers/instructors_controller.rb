class InstructorsController < ApplicationController
  before_action :find_instructor, only: [:show, :edit, :update]

  def index
    Instructor.certified
  end

  def new
    @instructor = Instructor.new
  end

  def show
    @instructor = Instructor.find(params[:id])
    Instructor.specialty(params[:name])
  end

  def edit
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
    @instructor.update(instructor_params)
    if @instructor.save
      redirect_to instructor_path(@instructors)
    else
      render :edit
    end
  end

  private

  def find_instructor
    @instructor = Instructor.find_by(id: params[:id])
  end

  def instructor_params
    params.require(:instructor).permit(:name, :gym, :specialty)
  end
end
