class Leave < ApplicationRecord
   enum status: [:requested, :approved, :rejected]
end
