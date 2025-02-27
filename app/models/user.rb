# frozen_string_literal: true

class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::Allowlist

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_one :trainer, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A\w+[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }, if: -> { password.present? }
  validates :cpf, presence: true, uniqueness: true
  validate :cpf_format
  validates :name, presence: true

  enum :status, { active: 0, inactive: 1 }
  enum :role, { student: 0, trainer: 1, admin: 2 }

  def update_jwt_expiration
    last_jti = AllowlistedJwt.where(user_id: id).last

    last_jti.update exp: 30.days.from_now if active?
  end

  private

  def cpf_format
    errors.add(:cpf, 'CPF inválido') unless CPF.valid?(cpf)
  end
end
