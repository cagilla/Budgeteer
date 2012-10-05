# == Schema Information
#
# Table name: accounts
#
#  id               :integer          not null, primary key
#  name             :string(255)
#  description      :string(255)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  starting_balance :decimal(, )
#  web_address      :string(255)
#  user_name        :string(255)
#  password         :string(255)
#  note             :text
#

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
