# == Schema Information
#
# Table name: transactions
#
#  id          :integer          not null, primary key
#  date        :date
#  check       :string(255)
#  description :string(255)
#  amount      :decimal(, )
#  note        :text
#  account_id  :integer
#  is_cleared  :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category    :string(255)
#

class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :check, :date, :description, :is_cleared, :note, :category_id
  
  validates_presence_of :amount, :date
  
  belongs_to :account
  belongs_to :category

  def self.search(search)
	  if search and search != ""
	    where('UPPER(description) LIKE ?', '%'+search.upcase+'%')
	  else
	    scoped
	  end
  end


end
