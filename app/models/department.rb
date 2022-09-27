class Department < ApplicationRecord
  has_many :employ
  Department.order(:name).to_a
end
