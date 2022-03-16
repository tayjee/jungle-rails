require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

    scenario "They see product details when clicking on a product" do
      visit root_path
      find('img', match: :first).click
      sleep 3
      save_screenshot

      expect(page).to have_css 'article.product-detail'
  end
end