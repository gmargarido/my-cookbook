class Recipe < ApplicationRecord
  belongs_to :cuisine
  validates :title, presence: true
  validates :recipe_type, presence: true
  validates :difficulty, presence: true
  validates :cook_time, presence: true
  validates :cook_time, numericality: { only_integer: true }
  validates :method, presence: true
end
