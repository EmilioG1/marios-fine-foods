class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates_length_of :author, maximum: 20
  validates :rating, presence: true
  validates_numericality_of :rating, greater_than_or_equal_to: 1
  validates_numericality_of :rating, less_than_or_equal_to: 5
  validates :content_body, presence:true
  validates_length_of :content_body, minimum: 50
  validates_length_of :content_body, maximum: 250
end