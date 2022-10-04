class CreateLeaves < ActiveRecord::Migration[6.0]
  def change
    create_table "leaves", force: :cascade do |t|
      t.belongs_to :employee
      t.integer :status, default: 0
      t.datetime :from_date
      t.datetime :to_date
      t.integer  :total_day
    end
     add_foreign_key "leaves", "employees"
  end
end



