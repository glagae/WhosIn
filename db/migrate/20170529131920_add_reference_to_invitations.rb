class AddReferenceToInvitations < ActiveRecord::Migration[5.1]
  def change
    add_reference :invitations, :user, foreign_key: true
    add_reference :invitations, :event, foreign_key: true
  end
end
