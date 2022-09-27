class Address < ApplicationRecord
  belongs_to :employ
  # validates :c_address,:p_address, presence: true

end
