class Event < ApplicationRecord
  has_many :invitations
  has_many :menu_items
end
