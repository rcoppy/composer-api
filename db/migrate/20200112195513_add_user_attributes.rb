class AddUserAttributes < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_address, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :photo, :string
    add_column :users, :bio, :text
    add_column :users, :is_deleted, :boolean
    add_column :users, :date_deleted, :date
    add_column :users, :is_admin, :boolean
    add_column :users, :is_curator, :boolean
  end
end
