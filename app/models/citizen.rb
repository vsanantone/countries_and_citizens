class Citizen < ApplicationRecord
  belongs_to :country


  def self.employed
    Citizen.where(employed: true)
  end

  def self.alpha_sort(condition)
    self.all.order(condition)
  end
  
end
