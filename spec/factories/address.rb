# frozen_string_literal: true

FactoryBot.define do
    factory :address do
      zipcode      { random_string }
      publicplace  { random_string }
      district     { random_string }
      city         { random_string }
      uf           { valid_uf.sample }
    end
  end
  