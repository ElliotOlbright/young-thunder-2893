require 'rails_helper'

describe 'Studios Index page' do 
  before :each do
    @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    @sony = Studio.create(name: 'Sony Studios', location: 'New York')
    @sony.movies.create(title: 'The Last Of Us', creation_year: 2019, genre: 'Action/Adventure')
    @sony.movies.create(title: 'Spongebob the Movie', creation_year: 2001, genre: 'Comedy')

    visit "/studios"
  end

  it 'can see page' do 
    expect(current_path).to eq('/studios')
    expect(page).to have_content('Studio Index Page')
  end 

  it 'can display studio names and movies' do 
    expect(page).to have_content("#{@universal.name}")
  end 
end 