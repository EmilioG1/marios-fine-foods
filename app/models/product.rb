class Product < ApplicationRecord

  scope :recent, -> { order(created_at: :desc).limit(3)}

  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates_length_of :name, maximum: 20
  validates :cost, presence: true
  validates_numericality_of :cost
  validates :country_of_origin, presence: true
  validates_length_of :country_of_origin, maximum: 20

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end