class ChangeAmountToDecimalForTransaction < ActiveRecord::Migration
  def up
  	change_column :transactions, :amount, :decimal
  end

  def down
  	change_column :transactions, :amount, :float
  end
end
