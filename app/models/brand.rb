class Brand < ApplicationRecord
  has_many :models
  validates :name, presence: true, uniqueness: true
  # validates_numericality_of :average_price, only_integer: true, greater_than_or_equal_to: 100000

  def update_average_price
    average_price = models.average(:average_price)
    update(average_price: average_price)
  end
end
