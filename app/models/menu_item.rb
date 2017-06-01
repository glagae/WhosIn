class MenuItem < ApplicationRecord
  # Associtations
  belongs_to :invitation, optional: true
  belongs_to :event

  # Validations
  validates :name, presence: true
  # validates :category, presence: true
  # validates :bring, presence: true

  def who
    if self.invitation.user.nil?
      puts "Still missing"
    else
      self.invitation.user
    end
  end
end
