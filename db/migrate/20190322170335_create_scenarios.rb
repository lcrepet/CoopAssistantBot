class CreateScenarios < ActiveRecord::Migration[5.1]
  def change
    create_table :scenarios do |t|
      t.references :conversation, foreign_key: true
      t.string :type
      t.json :parameters

      t.timestamps
    end
  end
end
