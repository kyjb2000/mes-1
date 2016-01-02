class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :gender, :string
    add_column :users, :martial_status, :string
    add_column :users, :birth_date, :string
    add_column :users, :phone_number, :string
    add_column :users, :avatar, :string
    add_column :users, :description, :string
  end
end
