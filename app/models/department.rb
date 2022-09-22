class Department < ApplicationRecord
  belongs_to :employee
  Department.order(:name).to_a
end
