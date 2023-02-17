class Food < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :recipes, through: :recipe_food, dependent: :destroy

  validates :name, presence: true
  validates :measurement_unit, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal: 0 }
  validates :quantity, presence: true, numericality: { greater_than_or_equal: 0 }
end
