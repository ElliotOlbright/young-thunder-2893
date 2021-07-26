require 'rails_helper'

RSpec.describe Movie do
  describe 'relationships' do
    it { should belong_to(:studio) }
    it {should have_many(:movie_actors)}
    it {should have_many(:actors).through(:movie_actors)}
  end

  describe 'methods' do 
    describe 'actors_ages'do
      it 'can order actors by age' do 
        universal = Studio.create(name: 'Universal Studios', location: 'Hollywood')
        movie_1 = universal.movies.create(title: 'Raiders of the Lost Ark', creation_year: 1981, genre: 'Action/Adventure')
        actor1 = Actor.create(name: 'Jimmy Jims', age: 22)
        actor2 = Actor.create(name: 'Johnny Johns', age: 20)
        MovieActor.create(movie: movie_1, actor: actor1)
        MovieActor.create(movie: movie_1, actor: actor2)

        expect(movie_1.actors).to eq([actor1, actor2])
        expect(movie_1.actors_ages).to eq([actor2, actor1])
      end 
    end 
  end 
end