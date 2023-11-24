# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'open-uri'
require 'json'
require 'faker'

puts '10 movies are beeing created'

Movie.destroy_all

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies_serialized = URI.open(url).read
movies = JSON.parse(movies_serialized)
movies['results'].each do |movie|
  movie = Movie.create(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'],
                       poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}")
end

List.destroy_all

10.times do
  @list = List.create(
    name: Faker::Games::ClashOfClans.troop
  )
end
