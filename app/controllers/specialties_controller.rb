class SpecialtyController < ApplicationController
  before_action :require_login

    def new
      @specialty = Specialty.new
    end

    def create
      @specialty = Specialty.new(specialty_params)
      if @specialty.save
        redirect_to client_path(current_client)
      else
        render :new
      end
    end

    private
      def specialty_params
        params.require(:specialty).permit(:name)
      end
  end
