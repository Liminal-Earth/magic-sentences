class CreateSentences < ActiveRecord::Migration[7.0]
  def change
    create_table :sentences do |t|
      t.string :sentence
      t.integer :user_id
      t.timestamps
    end
  end
end
