class CreateMenuItems < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_items do |t|
      t.string :name
      t.string :category
      t.integer :quantity
      t.boolean :bring

      t.timestamps
    end
  end
end
