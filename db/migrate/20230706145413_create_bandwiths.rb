class CreateBandwiths < ActiveRecord::Migration[7.0]
  def change
    create_table :bandwiths do |t|
      t.references :server, null: false, foreign_key: true, limit: 4
      t.float :Value
      t.integer :value_id, limit: 4
      t.text :interface_name

      t.timestamps
    end
  end
end
