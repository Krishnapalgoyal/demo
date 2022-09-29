class Address < ApplicationRecord
  belongs_to :employee
  # validates :c_address,:p_address, presence: true

end
