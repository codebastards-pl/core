class AddCompanyNumberAndForComanyToShoppeOrders < ActiveRecord::Migration
  def change
    add_column :shoppe_orders, :company_number, :string
    add_column :shoppe_orders, :for_company, :boolean, default: false
  end
end
