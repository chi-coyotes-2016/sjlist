class User < ActiveRecord::Base
  # include BCrypt
  has_secure_password
  validates :name, presence: true
  validates :email, format: {with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/, message: "must be a valid email address"},
                    uniqueness: {message: "already taken"}
  # validate :password_is_strong
  has_many :posts, foreign_key: :author_id
  validates :password, length: { minimum: 8 }

  # def password
  #   @password = Password.new(encrypted_password)
  # end

  # def password_is_strong
  #   if @proposed_password.length < 8
  #     errors.add(:password, "must be at least 8 chars long")
  #   end
  # end

  # def password=(new_password)
  #   @proposed_password = new_password
  #   @password = Password.create(new_password)
  #   self.encrypted_password = @password
  # end

  # def authenticate(password)
  #   self.password == password
  # end
end
