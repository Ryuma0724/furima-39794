class AddGivennamekanaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :given_name_kana, :string
  end
end
