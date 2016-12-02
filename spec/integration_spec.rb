require 'capybara/rspec'
require "./app"
require "word"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  before do
    visit('/')
  end
  it('displays content') do
    expect(page).to have_content('Words')
  end
  it('displays a list of all words') do
    expect(page).to have_content('Dog')
  end
end
describe('the individual word path', {:type => :feature}) do
  before do
    visit('/')
    click_link('Lion')
  end
  it ('displays the individual word') do
    expect(page).to have_content('Lion')
  end
  it ('displays the individual word') do
    expect(page).to have_content('a dangerous, roaring thing')
  end
end
