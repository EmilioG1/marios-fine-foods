class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating, greater_than_or_equal_to: 1
  validates_numericality_of :rating, less_than_or_equal_to: 5
  validates :content_body, presence: true, length: { minimum: 50 }
  validates :product_id, presence: true

  before_save(:titleize_author)

  private
    def titleize_author
      self.author = self.author.titleize
    end
end