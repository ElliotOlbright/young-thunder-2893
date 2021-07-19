require 'rails_helper'

describe 'Studios Index page' do 
  before :each do
    @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    visit "/studios"
  end

  xit 'can take user to movie show page' do 
    click_link("#{@universal.movies.first.title}")
    expect(current_path).to eq("/studios/#{@universal.id}/")
  end 
end
