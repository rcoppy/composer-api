class CreateScores < ActiveRecord::Migration[6.0]
  def change
    create_table :scores do |t|
      t.belongs_to :author_id, foreign_key: {to_table: :users}
      t.belongs_to :app, foreign_key: true
      
      t.string :file
      t.string :title
      t.text :about
      t.string :thumbnail
      
      t.boolean :is_deleted
      t.date :date_deleted

      t.timestamps
    end
  end
end
