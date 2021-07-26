class MovieActorsController < ApplicationController 
  def create 
    require "pry"; binding.pry
    movie = Movie.find(params[:movie_id])
    actor = Actor.find_by(name: params[:actor_name])
    MovieActor.create(movie: movie, actor: actor)

    redirect_to "/movies/#{movie.id}"
  end 
end  