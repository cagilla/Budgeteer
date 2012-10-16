# == Schema Information
#
# Table name: transactions
#
#  id                 :integer          not null, primary key
#  date               :date
#  check              :string(255)
#  description        :string(255)
#  amount             :decimal(, )
#  note               :text
#  account_id         :integer
#  is_cleared         :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  category           :string(255)
#  isTransfer         :boolean          default(FALSE)
#  transferAccount_id :integer
#

class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :check, :date, :description, :is_cleared, :note, :category, :isTransfer, :transferAccount_id
  validates_presence_of :amount, :date
  
  belongs_to :account, class_name: 'Account'
  belongs_to :transferAccount, class_name: 'Account'
  
  def self.transactions_for_account(acct)
  	where "account_id = ? OR \"transferAccount_id\" = ?", acct, acct
  end
end
