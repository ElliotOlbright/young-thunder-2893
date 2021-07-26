require 'rails_helper'

describe 'Movie Show page' do 
  before :each do
    @universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
    @movie_1 = @universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
    @actor1 = Actor.create(name: 'Jimmy Jims', age: 20)
    @actor2 = Actor.create(name: 'Johnny Johns', age: 22)
    @actor3 = Actor.create(name: 'Johnny Johns', age: 22)
    @actor4 = Actor.create(name: 'Sway', age: 22)

    MovieActor.create(movie: @movie_1, actor: @actor1)
    MovieActor.create(movie: @movie_1, actor: @actor2)

    visit "/movies/#{@movie_1.id}"
  end

  it 'is the right page' do 
    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content("#{@movie_1.title}")
    expect(page).to have_content("#{@movie_1.creation_year}")
    expect(page).to have_content("#{@movie_1.genre}")
  end 

  it 'can display actors from youngest to oldest' do 
    expect(@actor1.name).to appear_before(@actor2.name)
  end 

  it 'can display the average age of actors' do 
    expect(page).to have_content("Average actors age: 21")
  end 

  it 'can add an actor to a movie' do 
    expect(page).to have_content("Add Actor To this movie")

    fill_in :actor_name, with: "Sway"

    click_button "Submit"

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content("Sway")
   

  end 


end
