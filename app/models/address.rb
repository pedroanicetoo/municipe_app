class Address < ApplicationRecord
  searchkick default_fields: %i[zipcode publicplace district city]

  validates :zipcode, presence: true
  validates :publicplace, presence: true
  validates :district, presence: true
  validates :city, presence: true
  validates :uf, presence: true
end
