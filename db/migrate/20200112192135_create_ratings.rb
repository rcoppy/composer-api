class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.index :application_id, foreign_key: true
      t.index :author_id, foreign_key: true

      t.integer :musicality
      t.integer :duration
      t.integer :instrumentation

      t.timestamps
    end
  end
end
