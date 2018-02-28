class Cuisine < ApplicationRecord
  has_many :recipes
  validates :name, presence: {message: "não pode estar em branco"}
  validates :name, uniqueness: {message: "já foi utilizado"}
end
