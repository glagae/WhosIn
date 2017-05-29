class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :max_invites
      t.string :address
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
