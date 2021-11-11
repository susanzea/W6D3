# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all 
Artwork.destroy_all 
ArtworkShare.destroy_all

artgirl24 = User.create!(username: "artgirl24")
living_picasso = User.create!(username: "living_picasso")
monetminion = User.create!(username: "monetminion")
murakami = User.create!(username: "murakami")

so_blue = Artwork.create!(
  title: "So_blue",
  image_url: 'bluepic.com',
  artist_id: living_picasso.id
)

so_purple24 = Artwork.create!(
  title: "So_purple24",
  image_url: 'purplepic.com',
  artist_id: artgirl24.id
)

haystack = Artwork.create!(
  title: "Haystack",
  image_url: 'haystack.com',
  artist_id: monetminion.id
)

bubble = Artwork.create!(
  title: "Bubble",
  image_url: 'bubble.com',
  artist_id: murakami.id
)

ArtworkShare.create!(artwork_id: so_blue.id, viewer_id: artgirl24.id)
ArtworkShare.create!(artwork_id: haystack.id, viewer_id: living_picasso.id)
ArtworkShare.create!(artwork_id: so_blue.id, viewer_id: monetminion.id)
ArtworkShare.create!(artwork_id: bubble.id, viewer_id: artgirl24.id)




# INSERT INTO 
#     users (username)
# VALUES
#     ('artgirl24'), 
#     ('living_picasso'),
#     ('monetminion'),
#     ('murakami');

# INSERT INTO
#     artworks (title, image_url, artist_id)
# VALUES 
#     ('So_blue', 'bluepic.com', (SELECT id FROM user WHERE username = 'living_picasso')),
#     ('So_purple24', 'purplepic.com', (SELECT id FROM user WHERE username = 'artgirl24')),
#     ('Haystack', 'haystack.com', (SELECT id FROM user WHERE username = 'monetminion')),
#     ('Bubble', 'bubble.com', (SELECT id FROM user WHERE username = 'murakami'));

# INSERT INTO
#     artwork_shares (artwork_id, viewer_id)
# VALUES
#     ((SELECT id FROM artworks WHERE title = 'So_blue'), (SELECT id FROM users WHERE username = 'artgirl24')),
#     ((SELECT id FROM artworks WHERE title = 'Haystack'), (SELECT id FROM users WHERE username = 'living_picasso')),
#     ((SELECT id FROM artworks WHERE title = 'So_blue'), (SELECT id FROM users WHERE username = 'monetminion')),
#     ((SELECT id FROM artworks WHERE title = 'Bubble'), (SELECT id FROM users WHERE username = 'artgirl24'));


