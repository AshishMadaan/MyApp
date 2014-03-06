class Comment < ActiveRecord::Base
  
 # validates :commenter, presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "Only letters allowed" }
 validates :commenter, presence: true
	mount_uploader :image, ImageUploader
  belongs_to :post
end
