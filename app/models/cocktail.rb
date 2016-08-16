class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses

  has_attachments :photos, maximum: 5

  validates :name, presence: true, uniqueness: true
end
