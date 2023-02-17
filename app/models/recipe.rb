class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :foods, through: :recipe_food, dependent: :destroy
end
