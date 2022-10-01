class Department < ApplicationRecord
  has_many :employees
  validates :name, :jobroll ,presence: true
  Department.order(:name).to_a
end
