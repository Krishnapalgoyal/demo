class Department < ApplicationRecord
  Department.order(:name).to_a
end
