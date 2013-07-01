class CreateCommodities < ActiveRecord::Migration
  def change
    create_table :commodities do |t|
      t.string :name
      t.string :base_unit

      t.timestamps
    end
  end
end
