class CountriesController < ApplicationController
  def index
    @countries = Country.all
    # require 'pry'; binding.pry
  end
  def show
    @country = Country.find(params[:id])
  end
end