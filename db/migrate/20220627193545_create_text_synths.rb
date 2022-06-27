class CreateTextSynths < ActiveRecord::Migration[7.0]
  def change
    create_table :text_synths do |t|
      t.string :text
      t.integer :sentence_id

      t.timestamps
    end
  end
end
