class TrainingController < ApplicationController

  def new
    @training = Training.new
  end

  def show
    @training = Training.all
  end 
end
