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
 	
  def available_balance
    starting_balance + transactions.to_a.sum { |transaction| transaction.date <= Date.today ? transaction.amount : 0 }
  end

end
