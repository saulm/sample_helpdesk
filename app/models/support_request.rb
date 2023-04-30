class SupportRequest < ApplicationRecord
  validates :name, :description, :email, :status, presence: true
  validates :status, inclusion: ["new", "in progress", "resolved"]
  validates :email, email: true
end
