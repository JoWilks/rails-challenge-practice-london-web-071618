class Employee < ApplicationRecord
  belongs_to :company
  belongs_to :office
  validates :name, presence: true, length: { minimum: 5}

end
