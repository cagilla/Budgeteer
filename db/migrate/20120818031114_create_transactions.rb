class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.date :date
      t.string :check
      t.string :description
      t.decimal :amount
      t.text :note
      t.integer :account_id
      t.boolean :is_cleared

      t.timestamps
    end
  end
end
