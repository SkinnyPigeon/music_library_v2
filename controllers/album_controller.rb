require_relative('../models/album')
require_relative('../models/artist')


get '/album/new' do
  @artists = Artist.all()
  erb( :new_album )
end

post '/album' do
  @album=Album.new( params )
  @album.save()
  erb( :create_album )
end
