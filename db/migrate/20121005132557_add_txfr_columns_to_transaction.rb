class AddTxfrColumnsToTransaction < ActiveRecord::Migration
  def change
    add_column :transactions, :isTransfer, :boolean, default: :false
    add_column :transactions, :transferAccount_id, :integer
  end
end
