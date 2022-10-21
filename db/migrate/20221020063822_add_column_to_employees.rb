class AddColumnToEmployees < ActiveRecord::Migration[6.0]
  def change
  remove_column :employees, :password, :text
    remove_column :employees, :email, :text
    add_column :employees, :email, :string
    add_column :employees, :encrypted_password, :string

     ## Recoverable
    add_column :employees, :reset_password_token, :string
    add_column :employees, :reset_password_sent_at,:datetime

    ## Rememberable
    add_column :employees, :remember_created_at,:datetime


    # Trackable
    add_column :employees, :sign_in_count,:integer, default: 0, null: false
    add_column :employees, :current_sign_in_at,:datetime
    add_column :employees, :last_sign_in_at,:datetime
    add_column :employees, :current_sign_in_ip,:string
    add_column :employees, :last_sign_in_ip,:string


    # Confirmable
    add_column :employees, :confirmation_token,:string
    add_column :employees, :confirmed_at,:datetime
    add_column :employees, :confirmation_sent_at,:datetime
    add_column :employees, :unconfirmed_email,:string


    # # Lockable
    # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at
  end
end