require_relative('../models/album')
require_relative('../models/artist')


get '/album/new' do
  @artists = Artist.all()
  erb( :'albums/new_album' )
end

post '/album' do
  @album=Album.new( params )
  @album.save()
  erb( :'albums/create_album' )
end

get '/album/new' do
  erb( :'albums/new_album' )
end

post '/album' do
  @album=Album.new( params )
  @album.save()
  erb( :'albums/create_album' )
end

get '/album' do
  @albums = Album.all()
  erb(:'albums/index_album')
end

get '/album/:id' do
  @album = Album.find( params[:id] )
  erb( :'albums/show_album')
end

post '/album/:id' do
  @pizza = Album.update( params )
  redirect to( "/album/#{ params[:id] }")
end

get '/album/:id/edit' do
  @album = Album.find( params[:id] )
  erb( :'albums/edit_album')
end

post '/album/:id/delete' do
  Album.delete( params[:id] )
  redirect to ( '/album' )
end

