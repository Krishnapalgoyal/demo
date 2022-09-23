class Employee < ApplicationRecord

  has_many :departments
  has_many :addresses, inverse_of: :employee
  accepts_nested_attributes_for :addresses
end
