class Post < ApplicationRecord
    belongs_to :user

    validates_presence_of :body

    mount_uploader :image, PostUploader

    has_many :post_likes, dependent: :destroy
end
