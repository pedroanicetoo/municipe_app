# frozen_string_literal: true

FactoryBot.define do
    factory :municipe do
      fullname  { random_string }
      cpf       { random_string }
      cns       { random_string }
      email     { random_string }
      birthdate { Date.today - random_number((10..100).to_a.sample).days }
      cpf       { random_string }
      status    { 0 }
      address   { create(:address) }
    end
  end
  