require "pry"
Restaurant.destroy_all
User.destroy_all
UserRestaurant.destroy_all

# Restaurant.create(name: "Taco Bell", location: "New York City")
# Restaurant.create(name: "Taco Bell Sucks", location: "New Jack City")
# Restaurant.create(name: "Babay's kids burgers", location: "guncoland")
# Restaurant.create(name: "miss may's alehouse", location: "chopatoolis")
# Restaurant.create(name: "Acurais", location: "Neyotokyo")
# Restaurant.create(name: "little johns big johns", location: "jesus christ superstar")

# User.create(name: "Carlos")
# User.create(name: "Jack")
# User.create(name: "Michelle")

client = Yelp::Fusion.client
resp = client.search('Woodbridge, VA', {term: 'restaurants'})

resp.businesses.each do |business|
    Restaurant.find_or_create_by(name: business.name, location: business.location.display_address.join(", "))
end

