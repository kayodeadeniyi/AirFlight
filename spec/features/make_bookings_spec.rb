require 'rails_helper'
require 'database_cleaner'

RSpec.feature "MakeBookings", type: :feature do
  Capybara.default_driver = :selenium

  before do
    # page.driver.browser.manage.window.resize_to(990,640)
    OmniAuth.config.test_mode = true
    #load "#{Rails.root}/db/seeds.rb"
  end

  after do
    DatabaseCleaner.clean
  end

  scenario "User can search for flights" do
    visit root_path

    click_link 'Log In'

    click_link 'Google'

    find('#from_airport').find(:xpath, 'option[1]').select_option
    find('#to_airport').find(:xpath, 'option[2]').select_option
    find('#date').find(:xpath, 'option[2]').select_option
    find('#passengers').find(:xpath, 'option[1]').select_option

    click_button "Search"


    # expect(page).to have_selector("div", id: "search_result2")
    expect(page).to have_selector('#search_result2')
    # expect(page).to have_selector("li", text: "Passenger")
    page.choose('test1')
    
    click_button "Order"



  end
end
