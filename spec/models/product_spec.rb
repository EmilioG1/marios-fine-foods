require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }

  it { should have_many :reviews }

  it { should validate_presence_of :name }
    
  it { should validate_presence_of :cost }
  
  it { should validate_numericality_of(:cost)}
  
  it { should validate_presence_of :country_of_origin }
  
  it("titleizes the name of a product") do
    product = Product.create({name: "Pizza Crust", cost: "2", country_of_origin: "italy"})
    expect(product.name).to(eq("Pizza Crust"))
  end
end