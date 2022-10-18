class AssignLeave < ApplicationRecord
  validates :day, :year ,presence: true
  belongs_to :employee
end
