class AddNewsToShoppeProducts < ActiveRecord::Migration
  def change
    add_column :shoppe_products, :news, :boolean, default: false
    add_column :shoppe_product_categories, :news, :boolean, default: false
  end
end
