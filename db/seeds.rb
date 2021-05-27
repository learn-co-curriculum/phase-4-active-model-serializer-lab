3.times do
  author = Author.create(name: Faker::Name.unique.name)
  author.create_profile(email: Faker::Internet.email, username: Faker::Internet.username, bio: Faker::Hipster.paragraph, avatar_url: Faker::Avatar.image)
  num_times = rand(1..5)
  num_times.times do
    author.posts.create(title: Faker::Book.title, content: Faker::Hipster.paragraph(sentence_count: 5, random_sentences_to_add: 4))
  end
end

10.times do
  Tag.create(name: Faker::Lorem.word)
end

Post.all.each do |post|
  num_times = rand(1..5)
  tags = Tag.all.to_a

  num_times.times do
    post.tags.append(tags.shuffle!.pop)
  end
end 
