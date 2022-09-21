class CreateAdmins < ActiveRecord::Migration[6.0]
  def change
    create_table :admins do |t|
      t.string :name
      t.numeric :contact
      t.text :email
      t.text :password
      t.timestamps
    end
  end
end
