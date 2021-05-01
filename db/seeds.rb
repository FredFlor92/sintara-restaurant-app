# create some seed data


# create 2 users

freddy = User.create(name: "Freddy", email: "freddy@gmail.com", password: "password")
craig = User.create(name: "Craig", email: "craig@gmail.com", password: "password")

#Entries 

RestaurantEntry.create(content: "Today is hard as hell")

# use AR to pre-associate data

freddy.restaurant_entries.create(content: "we are building a Sinatra app")
craig.restaurant_entries.create(content: "we are building a Sinatra app")