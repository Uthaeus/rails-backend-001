class Blog < ApplicationRecord
  belongs_to :user
  belongs_to :category
  
  validates_presence_of :title, :body

  has_many :comments, dependent: :destroy
end
