class User < ApplicationRecord

  after_create :generate_key
  rolify
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :courses
  has_many :orders
  has_one :api_access_token
  
  private
  def generate_key
    ApiAccessToken.create(user: User.last)
    byebug
  end
       
end
