class AddMoreFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string
    add_column :users, :status, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :gender, :boolean
    add_column :users, :birthday, :date
    add_column :users, :about, :text
  end
end
