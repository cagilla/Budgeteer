class Category < ActiveRecord::Base
  attr_accessible :name
  has_many :transactions

  def self.list_category_options
  	Category.select("id, name").map { |x| [x.id, x.name] }
  end
  
end
