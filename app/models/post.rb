class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :title, presence: true, length: { maximum: 50 }
  validates :body, presence: true, length: { maximum: 1000 }
end
