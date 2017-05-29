class MenuItem < ApplicationRecord
  # Associtations
  belongs_to :invitation
  belongs_to :event

  # Validations
  validates :name, presence: true
  validates :category, presence: true
  validates :bring, presence: true
end
