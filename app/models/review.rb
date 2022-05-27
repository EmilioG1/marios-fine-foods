class Review < ApplicationRecord
  belongs_to :product

  validates :author, presence: true
  validates_length_of :author, maximum: 20
  validates :rating, presence: true
  validates_numericality_of :rating
  validates :content_body, presence:true
  validates_length_of :content_body, minimum: 5
end