require_relative('./models/artist')


get '/artist/new' do
  erb( :new_artist )
end

post '/artist' do
  @artist=Artist.new( params )
  @artist.save()
  erb( :create )
end