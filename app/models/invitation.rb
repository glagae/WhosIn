class Invitation < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :event
  has_many :menu_items

  # Validations
  validates :role, presence: true
end
