class CreateApplicationComments < ActiveRecord::Migration[6.0]
  def change
    create_table :application_comments do |t|
      t.index :application_id, foreign_key: true
      t.index :author_id, foreign_key: true
      t.text :text
      t.boolean :is_flagged

      t.boolean :is_deleted
      t.date :date_deleted
      
      t.timestamps
    end
  end
end
