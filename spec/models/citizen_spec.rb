require 'rails_helper'

RSpec.describe Citizen, type: :model do
  describe "Relationships" do
    it { should belong_to :country }
  end
end
