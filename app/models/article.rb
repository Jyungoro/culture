class Article < ActiveRecord::Base
	belongs_to :user
	has_many :comments, :dependent => :destroy
	default_scope -> { order('created_at DESC')}
	validates :user_id, presence: true
	validates :title, presence: true
	validates :content, presence: true
	mount_uploader :image, ImageUploader
end
