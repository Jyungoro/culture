class User < ActiveRecord::Base
  has_many :articles
  has_many :comments, :through => :articles
	validates :name, presence: true, length: { maximum: 50 }
	has_secure_password
	before_create :create_remember_token


  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.encrypt(User.new_remember_token)
    end
end
