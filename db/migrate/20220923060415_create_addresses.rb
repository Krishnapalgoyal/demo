class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.text   :c_address
      t.text   :p_address
      t.references :employee
      t.timestamps
    end
  end
end
