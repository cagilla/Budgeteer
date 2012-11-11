class ChangeCategorytoCategoryId < ActiveRecord::Migration
  def up
  	add_column :transactions, :category_id, :integer
  	transactions = Transaction.all
  	transactions.each do |transaction|
  		category = Category.find_by_name(transaction.category)
  		if !category.nil?
  			transaction.category_id = category.id
  		else
  			transaction.category_id = 1
  		end
  		transaction.save
  	end
  	remove_column :transactions, :category
  end

  def down
  	add_column :transactions, :category, :string
  	transactions = Transaction.all
  	transactions.each do |transaction|
  		category = Category.find_by_id(transaction.category_id)
  		if !category.nil?
  			transaction.category = category.name
  		else
  			transaction.category = ''
  		end
  		transaction.save
  	end
  	remove_column :transactions, :category_id
  end
end
