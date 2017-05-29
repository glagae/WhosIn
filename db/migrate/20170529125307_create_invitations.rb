class CreateInvitations < ActiveRecord::Migration[5.1]
  def change
    create_table :invitations do |t|
      t.string :role
      t.boolean :accepted

      t.timestamps
    end
  end
end
