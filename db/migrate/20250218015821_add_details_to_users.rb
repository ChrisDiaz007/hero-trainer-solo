class AddDetailsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :text
    add_column :users, :experience, :text
    add_column :users, :specialties, :string
  end
end
