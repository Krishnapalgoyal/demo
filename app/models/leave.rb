class Leave < ApplicationRecord
   enum status: [:requested, :approved, :rejected]
   belongs_to :employee
end
