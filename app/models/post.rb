class Post < ApplicationRecord
  paginates_per 6
  belongs_to :user
  has_many :comments
  has_many :likes
  has_one_attached :file

  has_many :postsaves
  

  validates :file, presence: true, content_type: [:png, :jpg, :jpeg], on: [:create, :update]
  validates :title, presence:true, on: [:create, :update]
  validates :content , presence:true, length: { minimum: 10 }, on: [:create, :update]

                                  
end
