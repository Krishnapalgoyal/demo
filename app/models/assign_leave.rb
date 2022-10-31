class AssignLeave < ApplicationRecord
  validates :day, :year ,presence: true
  belongs_to :employee
  validates :year, presence: true,
            format: {with: /(19|20)\d{2}/i,}
end
