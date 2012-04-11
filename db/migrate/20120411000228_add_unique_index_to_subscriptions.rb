class AddUniqueIndexToSubscriptions < ActiveRecord::Migration
  def change
    add_index :subscriptions, [:user_id, :leader_id], :unique => true
  end
end
