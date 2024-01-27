class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table   :addresses do |t|
      t.string     :zip_code,    null: false
      t.integer    :area_id,    null: false
      t.string     :municipality,    null: false
      t.string     :street,    null: false
      t.string     :building,    null: false
      t.string     :phone_number,    null: false
      t.references :order,    null: false, foreign_key: true
      t.timestamps
    end
  end
end
