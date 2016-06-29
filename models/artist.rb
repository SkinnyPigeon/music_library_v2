require( 'pry-byebug' )
require_relative( '../db/sql_runner' )

class Artist
  attr_reader(:name, :id)

  def initialize( options)
    @name = options['name']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO artists (name) VALUES ('#{@name}') RETURNING *"
    artist_data = run_sql(sql)
    @id = artist_data.first['id'].to_i
  end

  def albums()
    sql = "SELECT * FROM albums WHERE artist_id = #{@id}"
    albums_data = run_sql( sql )
    albums = albums_data.map { |album_data| Album.new(album_data) }
    return albums
  end

  def self.all()
    sql = "SELECT * FROM artists"
    artists_data = run_sql( sql )
    artists = artists_data.map {|artist_data| Artist.new( artist_data )}
    return artists
  end

  def self.find( id )
    sql = "SELECT * FROM artists WHERE id = #{id}"
    artist = run_sql( sql )
    result = Artist.new( artist.first )

    return result
  end

  def self.update( options )
    sql = "UPDATE artists SET 
          name='#{ options[ 'name' ]}'
          "
    run_sql( sql )
  end


end

# def self.library()
#   sql = "SELECT artists.name, albums.name FROM albums INNER JOIN artists on albums.artist_id = artists.id "
#   librarys_data = run_sql( sql )
#   # librarys = librarys_data.map { |artist, album| Artist.new()}
#   return library
# end
