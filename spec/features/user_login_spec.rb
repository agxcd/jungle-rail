require 'rails_helper'

RSpec.feature "User can login ", type: :feature do
   # SETUP
   before :each do
    
    User.create!(
        first_name: "Simple",
        last_name: "Rick",
        email: "rick@123.com",
        password: "12345",
        password_confirmation: "12345"
        )
    end


  scenario "See the usser name" do
    visit root_path

    first('nav.navbar').find_link('User').click
    find_link('Login').click
    fill_in "email", with: "rick@123.com"
    fill_in "password", with: "12345"
    find_button('Submit').click

    expect(page).to have_text('Signed in as Simple')
  end

end
