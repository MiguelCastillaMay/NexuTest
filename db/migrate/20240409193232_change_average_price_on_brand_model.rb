class ChangeAveragePriceOnBrandModel < ActiveRecord::Migration[7.1]
  def change
    change_column_default :brands, :average_price, 0
  end
end
