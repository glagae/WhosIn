class Event < ApplicationRecord
  # Associations
  has_many :invitations, dependent: :destroy
  has_many :menu_items, dependent: :destroy
  has_many :comments, dependent: :destroy
  accepts_nested_attributes_for :menu_items, reject_if: :all_blank, allow_destroy: true

  # Validations
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :address, presence: true
  validates :title, presence: true

  # Picture upload
  mount_uploader :photo, PhotoUploader

  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

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

  def guests
    self.invitations.map do |invitation|
      invitation.user
    end
  end

  def notresponded
    invitations_accepted = invitations.where(accepted: nil, role: "guest").or(invitations.where(accepted: false))
    invitations_accepted.map do |invitation|
      invitation.user
    end
  end

  def coming
    invitations_accepted = invitations.where(accepted: true, role: "guest")
    invitations_accepted.map do |invitation|
      invitation.user
    end
  end

  def missing
    menu_items.where(invitation: nil)
  end

  def comments_ordered
    self.comments.order('comments.created_at DESC')
  end

  def allowed_to_see_items?(user)
    self.coming.include?(user) || self.managers.include?(user)
  end


end
