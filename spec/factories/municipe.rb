# frozen_string_literal: true

FactoryBot.define do
    factory :municipe do
      fullname            { random_string }
      cpf                 { valid_cpf }
      cns                 { rand_cns }
      email               { valid_email }
      phone               { random_string }
      birthdate           { Date.today - random_number((10..100).to_a.sample).days }
      status              { :inactive }
      address             { create(:address) }
      avatar_file_name    { "doesn't matter" }
      avatar_content_type { "image/png" }
      avatar_file_size    { 1000 }
      avatar_updated_at   { Time.zone.now }
    end
  end
  