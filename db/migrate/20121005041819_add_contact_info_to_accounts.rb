class AddContactInfoToAccounts < ActiveRecord::Migration
  def change
    add_column :accounts, :web_address, :string
    add_column :accounts, :user_name, :string
    add_column :accounts, :password, :string
    add_column :accounts, :note, :text
  end
end
