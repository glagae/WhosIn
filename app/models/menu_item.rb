class MenuItem < ApplicationRecord
  belongs_to :invitation
  belongs_to :event
end
