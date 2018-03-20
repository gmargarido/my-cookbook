class Recipe < ApplicationRecord
  belongs_to :cuisine
  belongs_to :recipe_type
  validates :title,:difficulty,:cook_time,:method, presence: true
  validates :cook_time, numericality: { only_integer: true }

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
