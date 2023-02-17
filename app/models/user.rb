class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :recipes
  has_many :foods

  validates :name, presence: true, length: { maximum: 30 }
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
