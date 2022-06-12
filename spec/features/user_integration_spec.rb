require 'rails_helper'

describe 'adding a user process' do
  it 'adds new user' do
    visit '/users/sign_up'
    click_link 'Register'
    fill_in 'user_email', :with => 'fake@gmail.com'
    fill_in 'user_password', :with => 'newword'
    fill_in 'user_password_confirmation', :with => 'newword'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
end

describe 'user routes' do
  before(:each) do
    @product = Product.create!(name: "Glengoolie Blue", cost: 80, country_of_origin: "United States", id: nil)
    visit '/users/sign_up'
    fill_in 'user_email', :with => 'fake@gmail.com'
    fill_in 'user_password', :with => 'newword'
    fill_in 'user_password_confirmation', :with => 'newword'
    click_on 'Sign up'
    click_on 'Check out our products'
  end
  
  it 'lets a user add a review' do
    first(:link, "Glengoolie Blue").click
    click_on 'Add a review'
    fill_in 'Author', with: "Sterling Archer" 
    fill_in 'Rating', with: 5 
    fill_in 'Content body', with: "Are we still doing phrasing? Lana? LANAAAA! Danger zooooooooooone."
    click_on 'Create Review'
    expect(page).to have_content("Review successfully added! It had better be positive!")
  end
  
  it 'lets a user read a review' do
    Review.create!(author: "Sterling Archer", rating: 5, content_body: "Are we still doing phrasing? Lana? LANAAAA! Danger zooooooooooone.", product_id: @product.id)
    first(:link, "Glengoolie Blue").click
    click_on 'Sterling Archer'
    expect(page).to have_content("Are we still doing phrasing? Lana? LANAAAA! Danger zooooooooooone.")
  end
  
  it 'will not let non-admins create a new product' do
    visit 'products/new'
    expect(page).to have_content("Welcome to Mario's Fine Foods")
  end
  
  it 'will not let non-admins edit a product' do
    visit "products/#{@product.id}/edit"
    expect(page).to have_content("Welcome to Mario's Fine Foods")
  end
  
  it 'will return user to products index' do
    first(:link, "Glengoolie Blue").click
    click_link 'Return to products page'
    expect(page).to have_content("Products")
  end
  
  it 'will return user to product page' do
    Review.create!(author: "Sterling Archer", rating: 5, content_body: "Are we still doing phrasing? Lana? LANAAAA! Danger zooooooooooone.", product_id: @product.id)
    first(:link, "Glengoolie Blue").click
    click_link 'Sterling Archer'
    click_on 'Return to product'
    expect(page).to have_content("Glengoolie Blue")
  end
  
  it 'will let user sign out' do
    visit '/products'
    click_on 'Sign Out'
    expect(page).to have_content("Log in")
  end
  
  it 'will let user access home page' do
    visit '/products'
    click_on "Mario's Foods"
    expect(page).to have_content("Welcome to Mario's Fine Foods")
  end
end

describe 'admin routes' do
  before(:each) do
    @product = Product.create!(name: "Glengoolie Blue", cost: 80, country_of_origin: "United States", id: nil)
    visit '/users/sign_up'
    fill_in 'user_email', :with => 'fake@gmail.com'
    fill_in 'user_password', :with => 'newword'
    fill_in 'user_password_confirmation', :with => 'newword'
    click_on 'Sign up'
    User.where(email: "fake@gmail.com").update(admin: true)
    click_on 'Check out our products'
  end
  
  it 'lets an admin create a product' do
    click_on 'Add new product'
    fill_in 'Name', :with => 'Glengoolie Blue'
    fill_in 'Cost', :with => 40
    fill_in 'Country of origin', :with => "United States"
    click_on 'Create Product'
    expect(page).to have_content("Glengoolie Blue")
  end
  
  it 'lets an admin delete a product' do
    first(:link, "Glengoolie Blue").click
    click_on 'Delete'
    expect(page).to have_content("Product was deleted to keep the princess safe!")
  end
  
  it 'lets an admin edit a product' do
    first(:link, "Glengoolie Blue").click
    click_on 'Edit'
    fill_in 'Name', :with => 'Glengoolie Red'
    fill_in 'Cost', :with => 44
    fill_in 'Country of origin', :with => "United States"
    click_on 'Update Product'
    expect(page).to have_content("Glengoolie Red")
  end
  
  it 'lets an admin edit a review' do
    Review.create!(author: "Sterling Archer", rating: 5, content_body: "Are we still doing phrasing? Lana? LANAAAA! Danger zooooooooooone.", product_id: @product.id)
    first(:link, "Glengoolie Blue").click
    click_on 'Sterling Archer'
    click_on 'Edit'
    fill_in 'Rating', :with => 4
    fill_in 'Content body', :with => "Wee baby saemus Wee baby saemus Wee baby saemus Wee baby saemus Wee baby saemus Wee baby saemus"
    click_on 'Update Review'
    click_on 'Sterling Archer'
    expect(page).to have_content("Wee baby saemus Wee baby saemus Wee baby saemus Wee baby saemus Wee baby saemus Wee baby saemus")
  end
  
  it 'lets an admin delete a review' do
    Review.create!(author: "Sterling Archer", rating: 5, content_body: "Are we still doing phrasing? Lana? LANAAAA! Danger zooooooooooone.", product_id: @product.id)
    first(:link, "Glengoolie Blue").click
    click_on 'Sterling Archer'
    click_on 'Delete'
    expect(page).to have_content("The customer isn't always right!")
  end
end