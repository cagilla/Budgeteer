class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :check, :date, :description, :is_cleared, :note

  belongs_to :account
  
end
