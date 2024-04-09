class Model < ApplicationRecord
  belongs_to :brand
  validates :name, presence: true,  uniqueness: true
  validates :average_price, numericality: { only_integer: true, greater_than_or_equal_to: 100000 }, allow_blank: true

  after_save :update_brand_average_price

  def update_brand_average_price
    brand.update_average_price
  end
end
