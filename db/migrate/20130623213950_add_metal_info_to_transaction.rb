class AddMetalInfoToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :commodity_id, :integer
    add_column :transactions, :quantity, :integer, :default => 0
    add_column :transactions, :ounces, :decimal , :default => 0.0
    add_column :transactions, :vendor_id, :integer
    add_column :transactions, :fee, :decimal, :default => 0.0
  end
end
