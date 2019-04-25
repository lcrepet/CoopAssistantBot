class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :messenger_id
      t.string :coop_token
    end

    add_index :users, :messenger_id, unique: true
  end
end
