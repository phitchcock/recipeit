class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :recipes, through: :post_categories
end