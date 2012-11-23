class AddTxfrColumnsToTransaction < ActiveRecord::Migration
  def change
  	add_column :transactions, :is_transfer, :boolean, default: :false
    add_column :transactions, :transfer_account_id, :integer
  end
end
