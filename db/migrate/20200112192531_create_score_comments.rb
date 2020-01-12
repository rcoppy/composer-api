class CreateScoreComments < ActiveRecord::Migration[6.0]
  def change
    create_table :score_comments do |t|
      t.index :score_id, foreign_key: true
      t.index :author_id, foreign_key: true
      t.text :text
      t.boolean :is_flagged

      t.boolean :is_deleted
      t.date :date_deleted

      t.timestamps
    end
  end
end
