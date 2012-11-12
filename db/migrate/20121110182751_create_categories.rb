class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name

      t.timestamps
    end
    categories = Category.create([{ :name => '' }, { :name => 'Bank Fee' }, { :name => 'Books' }, { :name => 'Cash' }, 
    	                          { :name => 'Computer' }, { :name => 'Credit Card' }, { :name => 'Education' }, { :name => 'Entertainment' }, 
    	                          { :name => 'Games' }, { :name => 'Gifts' }, { :name => 'House Cleaning' }, { :name => 'Income' }, 
    	                          { :name => 'Insurance' }, { :name => 'Interest Earned' }, { :name => 'Investment' }, { :name => 'Latchkey' }, 
    	                          { :name => 'Lawn Care' }, { :name => 'Loans:Auto' }, { :name => 'Loans:Furniture' }, 
    	                          { :name => 'Loans:Mortgage' }, { :name => 'Medical' }, { :name => 'Property Taxes' }, 
    	                          { :name => 'Tithe' }, { :name => 'Transfer from Demand Notes' }, { :name => 'Transfer To Checking' }, 
    	                          { :name => 'Utilities' }, { :name => 'Utility' }])
  end
end
