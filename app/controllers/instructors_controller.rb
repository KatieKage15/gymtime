class InstructorsController < ApplicationController
  has_many :classes
  has_many :clients, through: :classes 
end
