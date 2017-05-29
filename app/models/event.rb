class Event < ApplicationRecord
  # Associations
  has_many :invitations
  has_many :menu_items

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
  validates :title, presence: true

  # Picture upload
  mount_uploader :photo, PhotoUploader

  def managers
    # return array with all the invitations where the role is manager
    manager_invitations = self.invitations.select do |invitation|
      invitation.role == "manager"
    end
    # return array with the corresponding user
    manager_invitations.map! do |invitation|
      invitation.user
    end
  end

end
