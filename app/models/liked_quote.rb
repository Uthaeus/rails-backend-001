class LikedQuote < ApplicationRecord
  belongs_to :user

  validates_presence_of :quote, :author

  def self.search(search)
    if search
      where('quote LIKE ?', "%#{search}%")
    else
      all
    end
  end

  
end
