class User < ActiveRecord::Base
  #extend FriendlyId
  #friendly_id :email, use: :slugged

  has_many :recipes
  has_many :comments
  has_many :votes
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
