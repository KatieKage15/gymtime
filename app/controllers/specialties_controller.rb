class SpecialtyController < ApplicationController

  def index
    @specialty = Instructor.specialty.all
     if params[:client_id]
       @specialty = Client.find(params[:client_id]).specialty
     else
       @specialty = Specialty.all
    end
   end

  def create
    specialty = Specialty.create(client_id: current_user.id, instructor_id: params[:instructor_id])
    redirect_to root_path
  end

end
