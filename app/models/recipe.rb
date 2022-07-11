class Recipe < ApplicationRecord
  has_and_belongs_to_many :ingredients
  has_and_belongs_to_many :tags
  has_many :rankings, dependent: :destroy
  
end
