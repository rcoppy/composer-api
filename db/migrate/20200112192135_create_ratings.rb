class CreateRatings < ActiveRecord::Migration[6.0]
  def change
    create_table :ratings do |t|
      t.belongs_to :app_id, index: true, foreign_key: true
      t.belongs_to :author_id, index: true, foreign_key: {to_table: :users}

      t.integer :musicality
      t.integer :duration
      t.integer :instrumentation

      t.timestamps
    end
  end
end
