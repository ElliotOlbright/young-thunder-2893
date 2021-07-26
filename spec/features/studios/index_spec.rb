require 'rails_helper'

describe 'Studios Index page' do 
  before :each do
    @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @universal.movies.create(title: 'Shrek', creation_year: 2001, genre: 'Comedy')

    @sony = Studio.create(name: 'Sony Studios', location: 'New York')
    @movie1 = @sony.movies.create(title: 'The Last Of Us', creation_year: 2019, genre: 'Action/Adventure')
    @movie2 = @sony.movies.create(title: 'Spongebob the Movie', creation_year: 2001, genre: 'Comedy')

    visit "/studios"
  end

  it 'displays each studios name and location' do 
    expect(page).to have_content(@sony.name)
    expect(page).to have_content(@sony.location)
    expect(page).to have_content(@universal.name)
    expect(page).to have_content(@universal.location)
  end 

  it 'displays studios movies' do 
    expect(page).to have_content(@movie2.title)
    expect(page).to have_content(@movie1.title)
  end 
end 
