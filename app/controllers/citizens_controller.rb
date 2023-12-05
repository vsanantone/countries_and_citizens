class CitizensController < ApplicationController
  def index
    @citizens = Citizen.employed
  end

  def show
    @citizen = Citizen.find(params[:id])
  end

  def edit
    @citizen = Citizen.find(params[:id])
  end

  def update
    @citizen = Citizen.find(params[:id])
    @citizen.update(name: params[:name], 
                    employed: params[:employed], 
                    age: params[:age],
    )
    # @citizen.update(citizen_params))
    redirect_to "/citizens/#{@citizen.id}"
  end

  # private

  #   def citizen_params
  #     params.permit(:name, :employed, :age)
  #   end
end