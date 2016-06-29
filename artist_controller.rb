require_relative('./models/artist')


get '/artist/new' do
  erb( :new_artist )
end