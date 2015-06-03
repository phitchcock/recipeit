class Recipe < ActiveRecord::Base
  belongs_to :user
<<<<<<< HEAD
  has_many :post_categories
  has_many :categories, through: :post_categories
=======
  has_many :comments
>>>>>>> 719e22c87c7b6c99c76c355eb7b9a798850a933e
end