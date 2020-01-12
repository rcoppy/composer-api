class CreateApplicationComments < ActiveRecord::Migration[6.0]
  def change
    create_table :application_comments do |t|
      t.belongs_to :app, foreign_key: true
      t.belongs_to :author_id, foreign_key: {to_table: :users}
      t.text :text
      t.boolean :is_flagged

      t.boolean :is_deleted
      t.date :date_deleted
      
      t.timestamps
    end
  end
end
