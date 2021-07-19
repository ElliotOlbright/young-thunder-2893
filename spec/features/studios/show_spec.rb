require 'rails_helper'

describe 'Studios Index page' do 
  before :each do
    @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    visit "/studios/#{@universal.id}"
  end

  it 'can see page' do 
    expect(current_path).to eq("/studios/#{@universal.id}")
    expect(page).to have_content('Studio Show Page')
  end 

  it 'can take user to movie show page' do 
    click_link("#{@universal.movies.first.title}")
    expect(current_path).to eq("/movies/#{@universal.id}/#{@universal.movies.first.id}")
  end
end 