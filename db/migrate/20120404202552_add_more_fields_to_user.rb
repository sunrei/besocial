class AddMoreFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nick, :string, :default => "", :null => false
    add_column :users, :status, :string, :default => "", :null => false
    add_column :users, :first_name, :string, :default => "", :null => false
    add_column :users, :last_name, :string, :default => "", :null => false
    add_column :users, :gender, :boolean
    add_column :users, :birthday, :date
    add_column :users, :about, :text, :default => "", :null => false
  end
end
