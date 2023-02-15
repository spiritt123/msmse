class Server < ApplicationRecord
  def change
    create_table :serveres, :id => false do |t|
      t.integer :id
      t.string :ip
      t.string :alias

      t.timestamps
    end
    add_index :id, uique:true
  end
end
