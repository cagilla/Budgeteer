# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :transactions

  def self.list_category_options
  	Category.select("id, name").map { |x| [x.id, x.name] }
  end
  def self.default_scope
    Category.order(:name)
  end  
end
