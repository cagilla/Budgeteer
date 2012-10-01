class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :check, :date, :description, :is_cleared, :note, :category
  
  validates_presence_of :amount, :date
  
  belongs_to :account
  
end
