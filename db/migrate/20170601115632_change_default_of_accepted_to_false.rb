class ChangeDefaultOfAcceptedToFalse < ActiveRecord::Migration[5.1]
  def change
      change_column_default(:invitations, :accepted, false)
  end
end
