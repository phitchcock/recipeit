class Recipe < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged
  
  belongs_to :user
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments

  validates :title, :url, :description, presence: true
end