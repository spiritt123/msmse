class CreateServers < ActiveRecord::Migration[7.0]
  def change
    create_table :servers, :id => false do |t|
      t.string :id
      t.string :ip
      t.string :alias

      t.timestamps
    end
    add_index :servers, :id, unique: true
  end
end
