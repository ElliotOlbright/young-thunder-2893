require 'rails_helper'

describe 'Movie Show page' do 
  before :each do
    @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    visit "/movies/#{@universal.id}/#{@universal.movies.first.id}"
  end

  it 'is the right page' do 
    expect(current_path).to eq("/movies/#{@universal.id}/#{@universal.movies.first.id}")
    expect(page).to have_content("#{@universal.movies.first.title}")
    expect(page).to have_content("#{@universal.movies.first.creation_year}")
    expect(page).to have_content("#{@universal.movies.first.genre}")
  end 
end
