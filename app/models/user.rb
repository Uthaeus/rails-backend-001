class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  def jwt_payload
    super
  end

  validates_presence_of :username, :email 

  mount_uploader :avatar, AvatarUploader

  has_many :liked_quotes, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  def liked_quote?(quote)
    liked_quotes.find_by_quote(quote)
  end

  def like(quote)
    liked_quotes.create(quote: quote.quote, author: quote.author)
  end

  def unlike(quote)
    liked_quotes.find_by_quote(quote).destroy
  end

  def liked_quotes 
    LikedQuote.where(user_id: id)
  end
end
