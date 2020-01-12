class CreateDecisions < ActiveRecord::Migration[6.0]
  def change
    create_table :decisions do |t|
      t.belongs_to :app, foreign_key: true
      t.belongs_to :author_id, foreign_key: {to_table: :users}
      
      t.date :date_finalized
      t.boolean :is_pending
      t.boolean :is_accepted
      t.text :comment

      t.timestamps
    end
  end
end
