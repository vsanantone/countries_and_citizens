class Country < ApplicationRecord
  has_many :citizens

  def self.countries_ordered  #Class method self.
    #grabs all my countries in order by most recently created
    all.order(created_at: :desc) # or "created_at"
  end

  def census
    citizens.count
  end
  #Look up Active Record Methods

end