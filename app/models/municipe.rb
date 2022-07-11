class Municipe < ApplicationRecord
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  
  belongs_to :address
  accepts_nested_attributes_for :address
  
  enum status: {
    active: 0,
    inactive: 1
  }

  validates :fullname, presence: true
  validates :cpf, presence: true
  validates :cns, presence: true
  validates :email, presence: true, format: { with: /\A[^@]+@[^@]+\z/ }
  validates :birthdate, presence: true
  validates :phone, presence: true
  validates :status, presence: true
  validates :avatar_file_name, presence: true
  validates :avatar_file_size, presence: true
  validates :avatar_content_type, presence: true
  validates :avatar_updated_at, presence: true

  validate :valid_cpf?
  validate :valid_cns?


  private

  def valid_cpf?
    return if CPF.valid?(cpf) == true

    errors.add(:cpf, :invalid)
  end

  def valid_cns?
    return if cns.try(:length) == 15 && cns.scan(/^\d+$/).any?

    errors.add(:cns, :invalid)
  end

end
