class Product < ApplicationRecord

  scope :most_recent, -> { order(created_at: :desc).limit(3)}
  scope :most_reviews, -> {(
    select("products.name, count(products.id) as reviews_count")
    .joins(:reviews)
    .group("products.id")
    .order("reviews_count DESC")
    .limit(1)
  )}
  scope :local, -> { where(country_of_origin: "United States") }

  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates_numericality_of :cost
  validates :country_of_origin, presence: true

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end
