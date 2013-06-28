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

require 'test_helper'

class TransactionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
