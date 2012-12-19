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
  attr_accessor :current_acct_id

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

  def self.transactions_for_account(acct)
    where "account_id = ? OR transfer_account_id = ?", acct, acct
  end

  def amount
    if (!current_acct_id.nil? && self.is_transfer == true)
      if (self.account_id == current_acct_id)
        read_attribute(:amount)
      else
        -read_attribute(:amount)
      end
    else
      read_attribute(:amount)
    end
  end
  
  def amount=(amt)
    if (!current_acct_id.nil? && self.is_transfer == true)
      if (self.account_id == current_acct_id)
        out = amt.to_f
      else
        out = (0-amt).to_f
      end
    else
      out = amt.to_f
      print("went through default")
    end
    write_attribute(:amount, out)
    puts("Wrote:" + out.to_s)
  end

end
