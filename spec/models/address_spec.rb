require 'rails_helper'

describe Address do
  describe "validations" do
    it { should validate_presence_of(:zipcode) }
    it { should validate_presence_of(:publicplace) }
    it { should validate_presence_of(:district) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:uf) }
  end
end
