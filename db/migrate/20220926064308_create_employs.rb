class CreateEmploys < ActiveRecord::Migration[6.0]
  def change
    create_table :employs do |t|
      t.string :name
      t.numeric :contact
      t.text :email
      t.string :type
      t.text :password
      t.references :department
      t.timestamps
    end
  end
end
