class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :message
      t.integer :author_id
      t.integer :user_id
      t.timestamps
    end
  end
end
