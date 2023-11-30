class CountryCitizensController < ApplicationController
  def index
    #big boo boo
    @country = Country.find(params[:id])
    # @citizens = Citizen.where(country_id: @country.id)
    @citizens = @country.citizens ## research this.
    # We want all citizens from a specfic country
    # select citizens where 
  end

  def new
    @country = Country.find(params[:id])
  end

  def create
    citizen = Citizen.create({
      name: params[:name],
      employed: params[:employed],
      age: params[:age],
      country_id: params[:id]
    })
    redirect_to "/countries/#{params[:id]}/citizens"
  end
end