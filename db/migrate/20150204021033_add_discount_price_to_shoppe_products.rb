class AddDiscountPriceToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :discount_price, :decimal, precision: 8, scale: 3, default: 0.0
  end
end
