class CountryCitizensController < ApplicationController
  def index
    #big boo boo
    @country = Country.find(params[:id])
    @citizens = Citizen.where(country_id: @country.id)
    #@citizens = @country.citizens
    # We want all citizens from a specfic country
    # select citizens where 
  end
end