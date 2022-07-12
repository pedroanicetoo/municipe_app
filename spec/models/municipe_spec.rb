# frozen_string_literal: true

require 'rails_helper'

describe Municipe do
  describe "associations" do
    it { should belong_to(:address) }
  end

  describe "validations" do
    it { should validate_presence_of(:fullname) }
    it { should validate_presence_of(:cpf) }
    it { should validate_presence_of(:cns) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_presence_of(:phone) }
    it { should validate_presence_of(:status) }

    describe ".valid_cpf?" do
      let(:instance) { create(:municipe) }

      context "when valid cpf" do
        it "valid" do
          expect(instance.valid?).to be_truthy
        end
      end

      context "when invalid cpf" do
        before { instance.update_column(:cpf, "invalid") }

        it "not valid" do
          expect(instance.valid?).to be_falsey
        end
      end
    end

    describe ".valid_cns?" do
      let(:instance) { create(:municipe) }

      context "when valid cns" do
        it "valid" do
          expect(instance.valid?).to be_truthy
        end
      end

      context "when invalid cns" do
        before { instance.update_column(:cns, "invalid") }

        it "not valid" do
          expect(instance.valid?).to be_falsey
        end
      end
    end

  end
end
