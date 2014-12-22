class Comment < ActiveRecord::Base
	belongs_to :article
	delegate :user, to: :article
	validates :name, presence: true
	validates :content, presence: true
end
