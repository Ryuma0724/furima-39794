class AddGivennameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :given_name, :string
  end
end
