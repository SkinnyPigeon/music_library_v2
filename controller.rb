require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('controllers/album_controller')
require_relative('controllers/artist_controller')

get '/library' do
  @artists = Artist.all
  @albums = Album.all
  erb(:library)
end