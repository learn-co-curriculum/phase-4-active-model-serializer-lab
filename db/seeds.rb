author1 = Author.create(
  name: "Wilbert Green"
)

author1.create_profile(
  email: "wgreen@yahoo.com", 
  username: "willygreen", 
  bio: "Keytar wolf bushwick seitan mumblecore try-hard marfa.", 
  avatar_url: "https://robohash.org/voluptasquisnihil.png?size=300x300&set=set1"
)

author2 = Author.create(
  name: "Sonya Wolf "
)

author2.create_profile(
  email: "swolf@msn.com", 
  username: "sonyaw", 
  bio: "Park bespoke diy selfies leggings shabby chic kombucha taxidermy.", 
  avatar_url: "https://robohash.org/eosdoloremest.png?size=300x300&set=set1"
)

post1 = author1.posts.create(
  title: "A Monstrous Regiment of Women", 
  content: "Stumptown photo booth chartreuse next level biodiesel. Park narwhal cronut hammock helvetica."
)

post1.tags.create(
  name: "repellat"
)

post2 = author2.posts.create(
  title: "Antic Hay", 
  content: "Typewriter neutra five dollar toast plaid. Polaroid tumblr put a bird on it."
)

post2.tags.create(
  name: "qui"
)
