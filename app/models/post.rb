class Post < ApplicationRecord
  belongs_to :user
  has_many :likes

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
