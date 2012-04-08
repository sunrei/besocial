class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :post
      t.has_attached_file :picture
    end
  end
end
