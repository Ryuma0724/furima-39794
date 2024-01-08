class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string  :title,  null: false
      t.string  :content,  null: false
      t.text  :genre_id,  null: false
      t.text  :condition_id,  null: false
      t.text  :charge_id,  null: false
      t.text  :area_id,  null: false
      t.text  :leadtime_id,  null: false
      t.integer  :price,  null: false
      t.references  :user,  null: false, foreign_key: true
      t.timestamps
    end
  end
end