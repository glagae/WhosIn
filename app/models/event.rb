class Event < ApplicationRecord
  # Associations
  has_many :invitations
  has_many :menu_items

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
  validates :title, presence: true

end
