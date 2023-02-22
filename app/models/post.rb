class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :file

  validates :file, presence: true, content_type: [:png, :jpg, :jpeg], on: [:create, :update]
  validates :title, presence:true, on: [:create, :update]
  validates :content , presence:true, length: { minimum: 10 }, on: [:create, :update]

                                  
end
