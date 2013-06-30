# == Schema Information
#
# Table name: vendors
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Vendor < ActiveRecord::Base
  attr_accessible :name, :url, :id
  has_many :transactions

  def self.list_vendors
  	Vendor.select("id, name").map { |x| [x.id, x.name] }
  end

end
