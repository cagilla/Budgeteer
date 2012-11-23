# == Schema Information
#
# Table name: transactions
#
#  id                  :integer          not null, primary key
#  date                :date
#  check               :string(255)
#  description         :string(255)
#  amount              :decimal(, )
#  note                :text
#  account_id          :integer
#  is_cleared          :boolean
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  category_id         :integer
#  is_transfer         :boolean          default(FALSE)
#  transfer_account_id :integer
#

class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :check, :date, :description, :is_cleared, :note, :category_id, :transfer_account_id, :is_transfer
  
  validates_presence_of :amount, :date
  
  belongs_to :account, class_name: 'Account'
  belongs_to :transfer_account, class_name: 'Account'
  
  belongs_to :category

  def self.search(search)
	  if search and search != ""
	    where('UPPER(description) LIKE ?', '%'+search.upcase+'%')
	  else
	    scoped
	  end
  end


end
