class Model < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true
  validates_numericality_of :average_price, only_integer: true, greater_than_or_equal_to: 100000
end
