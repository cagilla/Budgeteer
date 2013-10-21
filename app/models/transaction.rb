# == Schema Information
#
# Table name: transactions
#
#  id           :integer          not null, primary key
#  date         :date
#  check        :string(255)
#  description  :string(255)
#  amount       :decimal(, )
#  note         :text
#  account_id   :integer
#  is_cleared   :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  category_id  :integer
#  commodity_id :integer
#  quantity     :integer          default(0)
#  ounces       :decimal(, )      default(0.0)
#  vendor_id    :integer
#  fee          :decimal(, )      default(0.0)
#

class Transaction < ActiveRecord::Base
  attr_accessible :account_id, :amount, :check, :date, :description, :is_cleared, :note, :category_id, :quantity, :ounces, :price_per_ounce, :fee, :commodity_id, :vendor_id
  
  validates_presence_of :amount, :date
  
  belongs_to :account
  belongs_to :category

  def self.search(search)
	  if search and search != ""
	    where('UPPER(description) LIKE ? OR UPPER("check") LIKE ? OR UPPER(note) LIKE ?', '%'+search.upcase+'%','%'+search.upcase+'%','%'+search.upcase+'%')
	  else
	    scoped
	  end
  end

  def self.count_category(cat)
    Transaction.count(:conditions => ["category_id = ?", cat])
  end
 

end
