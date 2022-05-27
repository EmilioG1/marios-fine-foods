require 'rails_helper'

describe Product do
  it { should have_many(:reviews) }

  it { should validate_presence_of :name }

  it { should validate_length_of(:name).is_at_most(20)}

  it("titleizes the name of a product") do
    product = Product.create({name: "pizza crust", cost: "2", country_of_origin: "italy"})
    expect(product.name).to(eq("Pizza Crust"))
  end
end