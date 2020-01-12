class CreateDecisions < ActiveRecord::Migration[6.0]
  def change
    create_table :decisions do |t|
      t.index :application_id, foreign_key: true
      t.index :author_id, foreign_key: true
      
      t.date :date_finalized
      t.boolean :is_pending
      t.boolean :is_accepted
      t.text :comment
      

      t.timestamps
    end
  end
end
