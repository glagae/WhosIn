class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event
  has_many :menu_items

end
