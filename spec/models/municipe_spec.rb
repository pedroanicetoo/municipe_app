# frozen_string_literal: true

require 'rails_helper'

describe Municipe do
  describe "associations" do
    it { should belong_to(:address) }
  end

  describe "validations" do
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:email) }
  end
end
