3.times do
  author = Author.create(name: Faker::Name.unique.name)
  author.create_profile(email: Faker::Internet.email, username: Faker::Internet.username, bio: Faker::Lorem.paragraph, avatar_url: Faker::Avatar.image)
  num_times = rand(1..5)
  num_times.times do
    author.posts.create(title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph)
  end
end

10.times do
  Tag.create(name: Faker::Lorem.word)
end

Post.all.each do |post|
  num_times = rand(1..5)
  num_times.times do
    post.tags.append(Tag.find(Tag.pluck(:id).sample))
  end
end 
