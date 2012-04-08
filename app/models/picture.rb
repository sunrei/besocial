class Picture < ActiveRecord::Base
  belongs_to :post

  has_attached_file :picture, :styles => { :normal => "590>" }
  validates_attachment_presence :picture
  validates_attachment_size :picture, :less_than => 5.megabytes

end