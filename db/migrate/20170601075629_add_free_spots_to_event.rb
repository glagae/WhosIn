class AddFreeSpotsToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :free_spots, :integer
  end
end
