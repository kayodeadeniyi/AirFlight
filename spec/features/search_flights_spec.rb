require 'rails_helper'
require 'pry'

describe "SearchFlights", type: :feature do
  Capybara.default_driver = :selenium

  before do
    # page.driver.browser.manage.window.resize_to(990,640)
    OmniAuth.config.test_mode = true
    @var = Flight.first.id
  end

  scenario "User can search for flights"  do
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
    expect(page).to have_selector('.striped')

  end
end
