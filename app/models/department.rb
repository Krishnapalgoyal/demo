class Department < ApplicationRecord
  has_many :employees
  Department.order(:name).to_a
end
