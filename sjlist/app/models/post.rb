class Post < ActiveRecord::Base
  validates :title, presence: true
  belongs_to :author, class_name: "User"
  validates :author, presence: true
  belongs_to :category
  validates :category, presence: true
  validates :body, length: { minimum: 10 }
end
