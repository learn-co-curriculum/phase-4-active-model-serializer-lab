author1 = Author.create(
  name: "Wilbert Green"
)

author1.create_profile(
  email: "wgreen@kshlerin.co", 
  username: "willygreen", 
  bio: "Keytar wolf bushwick seitan mumblecore try-hard marfa.", 
  avatar_url: "https://robohash.org/voluptasquisnihil.png?size=300x300&set=set1"
)

author2 = Author.create(
  name: "Sonya Wolf "
)

author2.create_profile(
  email: "swolf@keeling.name", 
  username: "sonyaw", 
  bio: "Park bespoke diy selfies leggings shabby chic kombucha taxidermy.", 
  avatar_url: "https://robohash.org/eosdoloremest.png?size=300x300&set=set1"
)

author3 = Author.create(
  name: "Millicent Rath"
)

author3.create_profile(
  email: "millie@toy-hauck.org", 
  username: "millie", 
  bio: "Celiac meh scenester. Keytar hammock phlogiston. Before they sold out blue bottle pug whatever.", 
  avatar_url: "https://robohash.org/reiciendisexplicaboaliquid.png?size=300x300&set=set1"
)

post1 = author1.posts.create(
  title: "A Monstrous Regiment of Women", 
  content: "Stumptown photo booth chartreuse next level biodiesel. Park narwhal cronut hammock helvetica."
)

post1.tags.create(
  name: "repellat"
)

post1.tags.create(
  name: "qui"
)

post2 = author1.posts.create(
  title: "Clouds of Witness", 
  content: "Selfies pickled crucifix offal. Celiac art party godard narwhal retro freegan selvage gastropub. Leggings brunch biodiesel gastropub schlitz cold-pressed truffaut. Master hoodie chia banh mi offal knausgaard yolo. Authentic selfies twee pabst tumblr. Freegan keffiyeh cliche gastropub. Yr vinyl cliche synth freegan forage. Biodiesel food truck fixie lo-fi 8-bit drinking neutra."
)

post2.tags.create(
  name: "qui"
)

post2.tags.create(
  name: "facere"
)

post3 = author2.posts.create(
  title: "Antic Hay", 
  content: "Typewriter neutra five dollar toast plaid. Polaroid tumblr put a bird on it."
)

post3.tags.create(
  name: "occaecati"
)

post4 = author3.posts.create(
  title: "Look Homeward, Dylan", 
  content: "Selfies pickled crucifix offal. Celiac art party godard narwhal retro freegan selvage gastropub. Leggings brunch biodiesel gastropub schlitz cold-pressed truffaut. Master hoodie chia banh mi offal knausgaard yolo. Authentic selfies twee pabst tumblr. Freegan keffiyeh cliche gastropub. Yr vinyl cliche synth freegan forage. Biodiesel food truck fixie lo-fi 8-bit drinking neutra."
)

post4.tags.create(
  name: "facere"
)
