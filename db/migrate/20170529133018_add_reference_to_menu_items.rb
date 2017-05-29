class AddReferenceToMenuItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :menu_items, :invitation, foreign_key: true
    add_reference :menu_items, :event, foreign_key: true
  end
end
