
class Song  
    attr_accessor :name, :artist, :genre 
        @@count = 0 
        @@artists = [] 
        @@genres = []
    
      def initialize(name, artist, genre)
          @name = name
          @artist = artist
          @genre = genre
          @@artists << artist
          @@genres << genre
          @@count += 1 
      end
    
      def self.count
          @@count 
      end
    
      def self.artists
          @@artists.uniq
      end 
    
      def self.genres
          @@genres.uniq!
      end 
    
      def self.genre_count #return histogram hash 
        Hash[*@@genres.group_by{|v|v}.flat_map{|k, v| [k, v.size]}]
      # iterate over .genres, every new genre creates a new key
      # if key exists, counter += 1. {"rap" => 5, "rock" => 1, "country" => 3}
    
      end
    
      def self.artist_count
        Hash[*@@artists.group_by{|v|v}.flat_map{|k, v| [k, v.size]}]
      # => {"Beyonce" => 17, "Jay-Z" => 40}
      end 
    end 