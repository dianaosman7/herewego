
class Pin < ApplicationRecord
  belongs_to :user

  # Active Storage association
  has_one_attached :image
end