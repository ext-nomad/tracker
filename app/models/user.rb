class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable
  has_many :user_stocks
  has_many :stocks, through: :user_stocks

  def username
    email.split('@').first
  end
end
