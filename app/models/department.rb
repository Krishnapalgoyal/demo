class Department < ApplicationRecord
  has_many :employees, dependent: :destroy

  validates :name, :jobroll ,presence: true
  Department.order(:name).to_a
end
