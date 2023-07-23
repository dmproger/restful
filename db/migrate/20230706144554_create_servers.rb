class CreateServers < ActiveRecord::Migration[7.0]
  def change
    create_table :servers do |t|
      t.string :name

      t.timestamps
    end

    # serial type
    change_column :servers, :id, :integer, limit: 4
  end
end
