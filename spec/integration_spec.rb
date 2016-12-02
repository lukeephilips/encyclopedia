require 'capybara/rspec'
require "./app"
require "word"
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the home path', {:type => :feature}) do
  before do
    Word.clear()
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
    Word.clear()
    visit('/')
    click_link('Lion')
  end
  it ('displays the individual word') do
    expect(page).to have_content('Lion')
  end
  # it ('displays the individual word') do
  #   expect(page).to have_content('a dangerous, roaring thing')
  # end
end
describe('the add word path', {:type => :feature}) do
  before do
    Word.clear()
  end
  it ('displays the new word') do
    visit('/')
    click_link('Add a new word')
    fill_in('name', :with => 'Weasel')
    click_button('Add')
    expect(page).to have_content('Weasel')
  end

  it('allows user to view add a definition button') do
    visit('/')
    click_link('Add a new word')
    fill_in('name', :with => 'Weasel')
    click_button('Add')
    expect(page).to have_content('Weasel')
    click_link('Weasel')
    expect(page).to have_content('Add definition')
  end
  it('allows user to add a definition') do
    visit('/')
    click_link('Add a new word')
    fill_in('name', :with => 'Weasel')
    click_button('Add')
    expect(page).to have_content('Weasel')
    click_link('Weasel')
    expect(page).to have_content('Add definition')
    click_link('Add definition')
    fill_in('definition', :with => 'a creepy, crawly thing')
    click_button('Add')
    expect(page).to have_content('Weasel')
  end
  it('allows user to view added definition') do
    visit('/')
    click_link('Add a new word')
    fill_in('name', :with => 'Weasel')
    click_button('Add')
    expect(page).to have_content('Weasel')
    click_link('Weasel')
    expect(page).to have_content('Add definition')
    click_link('Add definition')
    fill_in('definition', :with => 'a creepy, crawly thing')
    click_button('Add')
    expect(page).to have_content('a creepy, crawly thing')
  end
end
