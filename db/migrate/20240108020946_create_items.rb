class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string  :title,  null: false
      t.text  :content,  null: false
      t.integer  :genre_id,  null: false
      t.integer  :condition_id,  null: false
      t.integer  :charge_id,  null: false
      t.integer  :area_id,  null: false
      t.integer  :leadtime_id,  null: false
      t.integer  :price,  null: false
      t.references  :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end