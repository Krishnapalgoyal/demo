class Employee < ApplicationRecord
  belongs_to :department
  has_many :addresses
  accepts_nested_attributes_for :addresses

 validates :name,:contact,:email ,:password, presence: { message: "must be given please" }
 validates :email, uniqueness: { message: "email is allready presence" }
 validates :password, uniqueness: { message: "password is allready presence" }

  def self.search(search)
    if search 
        where(["name LIKE ?","%#{search}%"])
    else
        all
    end
  end 


    
end


