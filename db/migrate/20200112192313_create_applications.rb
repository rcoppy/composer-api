class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.index :user_id, foreign_key: true

      t.timestamps
    end
  end
end
