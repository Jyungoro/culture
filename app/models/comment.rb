class Comment < ActiveRecord::Base
	belongs_to :article
	validates :name, presence: true
	validates :content, presence: true
end
