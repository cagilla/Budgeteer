# == Schema Information
#
# Table name: accounts
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  description      :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  starting_balance :decimal(, )
#  web_address      :string(255)
#  user_name        :string(255)
#  password         :string(255)
#  note             :text
#  account_type     :integer          default(0)
#

class Account < ActiveRecord::Base
  require 'date'
  #has_secure_password
  validates :name, presence: true, uniqueness: true
  
  attr_accessible :description, :name, :starting_balance, :web_address, :user_name, :password, :note
  
  has_many :transactions, dependent: :destroy
  
  def final_balance
  	starting_balance + transactions.to_a.sum { |transaction| transaction.amount }
  end
 	
  def value(prices)
    transactions.to_a.sum { |transaction| transaction.quantity * transaction.ounces * prices[transaction.commodity_id] }
  end

  def total_cost()
    transactions.to_a.sum { |transaction| transaction.amount * transaction.quantity * transaction.ounces + transaction.fee  }
  end

  def available_balance
    starting_balance + transactions.to_a.sum { |transaction| transaction.date <= Date.today ? transaction.amount : 0 }
  end

  def reconciled_balance
    starting_balance + transactions.to_a.sum { |transaction| transaction.is_cleared? ? transaction.amount : 0 }
  end
  
  def isMetalType
    account_type == 1
  end
  # list of unreconciled transactions
  def unreconciled
    transactions.where("not is_cleared")
  end
  
  def self.reconciled_total
    accts = Account.all
    accts.to_a.sum { |m| m.reconciled_balance }
  end
  def self.final_total
    accts = Account.all
    accts.to_a.sum { |m| m.final_balance }
  end
end
