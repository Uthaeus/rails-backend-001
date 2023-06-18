class PostComment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates_presence_of :content
end
