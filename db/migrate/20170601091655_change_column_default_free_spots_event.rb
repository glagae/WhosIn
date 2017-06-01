class ChangeColumnDefaultFreeSpotsEvent < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:events, :free_spots, 1)
  end
end
