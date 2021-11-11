
class User < ApplicationRecord

    validates :username, presence: true
  
    has_many :artworks, 
        primary_key: :id,
        foreign_key: :artist_id,
        class_name: :Artwork
    
    has_many :received_artworkshares,
        primary_key: :id,
        foreign_key: :viewer_id,
        class_name: :ArtworkShare
    
    has_many :shared_artworks,
        through: :received_artworkshares,
        source: :artwork
    
end