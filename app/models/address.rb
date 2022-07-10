class Address < ApplicationRecord
  validates :zipcode, presence: true
  validates :publicplace, presence: true
  validates :district, presence: true
  validates :city, presence: true
  validates :uf, presence: true
end
