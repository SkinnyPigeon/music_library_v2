require_relative('../models/artist')


get '/artist/new' do
  erb( :'artists/new_artist' )
end

get '/artist' do
  @artists = Artist.all()
  erb(:'artists/index_artist')
end

post '/artist' do
  @artist=Artist.new( params )
  @artist.save()
  erb( :'artists/create_artist' )
end

get '/artist/:id' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/show_artist')
end

get '/artist/:id/edit' do
  @artist = Artist.find( params[:id] )
  erb( :'artists/edit_artist')
end

