class Customer < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :status, inclusion: { in: %w[active locked] }
end
