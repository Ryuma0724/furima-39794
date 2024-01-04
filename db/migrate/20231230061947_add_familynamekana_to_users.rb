class AddFamilynamekanaToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :family_name_kana, :string, null:false
  end
end
