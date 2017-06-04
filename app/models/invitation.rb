class Invitation < ApplicationRecord
  # Associations
  belongs_to :user
  belongs_to :event
  has_many :menu_items
  has_many :comments, dependent: :destroy

  # Validations
  validates :role, presence: true
  validates :user, uniqueness: { scope: :event }
end
