class Leave < ApplicationRecord
   enum status: [:requested, :approved, :rejected]
   belongs_to :employee
  before_create :calculate_number_of_day

   def calculate_number_of_day
      day = (self.to_date.to_date - self.from_date.to_date).to_i 
      self.total_day = day + 1
      end
end
