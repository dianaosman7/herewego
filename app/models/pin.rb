class Pin < ApplicationRecord
  has_one_attached :image

  validates :image,
            content_type: [
              "image/png",
              "image/jpeg",
              "image/webp",
              "application/pdf"
            ],
            size: { less_than: 10.megabytes }
end