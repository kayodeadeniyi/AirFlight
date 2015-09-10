require 'rails_helper'
require 'pry'

describe "MakeBookings", type: :feature do
  Capybara.default_driver = :selenium

  before do
    OmniAuth.config.test_mode = true
    @var = Flight.first.id
  end

  scenario "User can book flights"  do

    name = "Kayode"
    email = "kaykayboy@yahoo.com"

    visit root_path

    click_link 'Log In'
    click_link 'Google'
    find('#from_airport').find(:xpath, 'option[1]').select_option
    find('#to_airport').find(:xpath, 'option[2]').select_option
    find('#date').find(:xpath, 'option[1]').select_option
    find('#passengers').find(:xpath, 'option[1]').select_option
    click_button "Search"

    expect(page).to have_selector('#search_result2')
    expect(page).to have_selector("#test#{@var}", visible: false)

    find("label[for=test#{@var}]").click
    click_button "Order"

    expect(page).to have_selector('.centered')
    expect(page).to have_selector('.hoverable')
    expect(page).to have_selector("#booking-form")


    fill_in "booking[passengers_attributes][0][name]", with: name
    fill_in "booking[passengers_attributes][0][email]", with: email
    # Binding.pry
    click_button "Book Flight"

    expect(page).to have_selector("#search-form")
    expect(page).to have_selector('table')
    expect(page).to have_selector("p", text:"Total")
    expect(page).to have_selector("a", text:"CHECK OUT")


  end
end
