class AssignLeave < ApplicationRecord
  validates :day, :year ,presence: true
end
