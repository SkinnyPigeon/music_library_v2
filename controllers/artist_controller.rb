require_relative('../models/artist')


get '/artist/new' do
  erb( :'artists/new_artist' )
end

get '/artist' do

  erb(:index)
end

get '/artist/:id' do
  # @library=Artist.library
  erb( :show )
end

post '/artist' do
  @artist=Artist.new( params )
  @artist.save()
  erb( :'artists/create_artist' )
end