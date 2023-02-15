class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, :id => false do |t|
      t.string :id
      t.string :name
      t.string :password_digest
      t.integer :rank
      t.string :father

      t.timestamps
    end
    add_index :users, :id, unique: true
  end
end
