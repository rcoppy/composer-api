class CreateApps < ActiveRecord::Migration[6.0]
  def change
    create_table :apps do |t|
      t.belongs_to :author_id, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
