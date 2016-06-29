require_relative('./models/album')
require_relative('./models/artist')


get '/album/new' do
  @artists = Artist.all()
  erb( :new_album )
end
