class Commodity < ActiveRecord::Base
  attr_accessible :base_unit, :name
  has_many :transactions

  def self.list_commodities
  	Commodity.select("id, name").map { |x| [x.id, x.name] }
  end

end
