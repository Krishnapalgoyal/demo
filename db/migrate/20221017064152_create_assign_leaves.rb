class CreateAssignLeaves < ActiveRecord::Migration[6.0]
  def change
    create_table :assign_leaves do |t|
      t.integer :day 
      t.integer :year
      t.references :employee
      t.timestamps
    end
  end
end
