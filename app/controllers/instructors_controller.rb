class InstructorsController < ApplicationController

  def index
    Instructor.certified
  end

end
