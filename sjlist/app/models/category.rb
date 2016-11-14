class Category < ActiveRecord::Base
  has_many :posts
  validates :name, length: {minimum: 2}, uniqueness: true
end
