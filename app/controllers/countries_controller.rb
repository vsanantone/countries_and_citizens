class CountriesController < ApplicationController
  def index
    @countries = Country.countries_ordered
  end

  def show
    @country = Country.find(params[:id])

  end
  
  def new
  end

  def edit
    @country = Country.find(params[:id])

  end

  def update
    @country = Country.find(params[:id])
    @country.update(country_params)
    redirect_to "/countries/#{@country.id}"
  end

  def create
    Country.create(country_params)
    redirect_to '/countries' 
  end

  def destroy
    country = Country.find(params[:id])
    country.destroy
    redirect_to "/countries"
  end


  private

  def country_params
    params.permit(:name, :democratic, :year_founded)
  end

  # def create
  #   Country.create(name: params[:name], 
  #                 democratic: params[:democratic], 
  #                 year_founded: params[:year_founded])
  # end
end