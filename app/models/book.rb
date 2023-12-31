class Book < ApplicationRecord
  belongs_to :author
  has_many :price_histories
  has_many :order_items
  has_many :book_genres
  has_many :genres, through: :book_genres
  has_many :book_formats
  has_many :formats, through: :book_formats
  has_one_attached :image

  validates :title, presence: true
  validates :price, presence: true

  before_save :resize_image

  private

  def resize_image
    return unless image.attached?

    image.variant(resize_to_limit: [200, 200])
  end
end
