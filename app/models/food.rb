class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :recipes, through: :recipe_food, dependent: :destroy
end
