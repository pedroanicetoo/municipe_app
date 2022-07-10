class Municipe < ApplicationRecord
  belongs_to :address

  enum status: {
    active: 0,
    inactive: 1
  }

  validates :cpf, presence: true
  validates :cns, presence: true
  validates :email, presence: true
end
