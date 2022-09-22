class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.text :gender
      t.numeric :age
      t.text :address
      t.text :email
      t.text :password
      t.references :department 
      t.timestamps
    end
  end
end
