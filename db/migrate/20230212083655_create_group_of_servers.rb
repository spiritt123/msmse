class CreateGroupOfServers < ActiveRecord::Migration[7.0]
  def change
    create_table :group_of_servers, :id => false do |t|
      t.string :id
      t.integer :id_server
      t.integer :id_group

      t.timestamps
    end
    add_index :group_of_servers, :id, unique: true
  end
end
