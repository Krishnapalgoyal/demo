class UpdateEmployees < ActiveRecord::Migration[6.0]
  def change
     add_column(:employees, :provider, :string, limit: 50, null: false, default:'')
     add_column(:employees, :uid, :string, limit: 50, null: false, default:'')
     add_column(:employees, :status, :boolean)
  end
end
