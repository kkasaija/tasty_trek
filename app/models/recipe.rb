class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_food, dependent: :destroy
  has_many :foods, through: :recipe_food, dependent: :destroy

  validates :name, presence: true
  validates :preparation_time, presence: true
  validates :cooking_time, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :public, inclusion: { in: [true, false] }
end
