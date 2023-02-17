class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :trackable,
         :recoverable, :rememberable, :validatable, :confirmable
  has_many :recipes
  has_many :foods

  ROLES = %i[admin default].freeze

  def is?(requested_role)
    role == requested_role.to_s
  end
end
