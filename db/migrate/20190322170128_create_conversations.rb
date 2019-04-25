class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.string :recast_conversation_id
      t.string :participant_id

      t.timestamps
    end
  end
end
