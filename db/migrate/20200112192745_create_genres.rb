class CreateGenres < ActiveRecord::Migration[6.0]
  def change
    create_table :genres do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :scores, :genres do |t| end
  end
end
