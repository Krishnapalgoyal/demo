class AddDeletedAtToLeaves < ActiveRecord::Migration[6.0]
  def change
    add_column :leaves, :deleted_at, :datetime
    add_index :leaves, :deleted_at
  end
end
