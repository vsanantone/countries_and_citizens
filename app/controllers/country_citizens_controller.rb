class CountryCitizensController < ApplicationController
  def index
    @country = Country.find(params[:id])
  end
end