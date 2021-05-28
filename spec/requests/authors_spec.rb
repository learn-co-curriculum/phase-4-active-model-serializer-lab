require 'rails_helper'

RSpec.describe "Authors", type: :request do

  before do 
    author1 = Author.create(name: "Wilbert Green")
    author1.create_profile(
      email: "wgreen@kshlerin.co", 
      username: "willygreen", 
      bio: "Keytar wolf bushwick seitan mumblecore try-hard marfa.", 
      avatar_url: "https://robohash.org/voluptasquisnihil.png?size=300x300&set=set1"
    )
    
    author2 = Author.create(name: "Sonya Wolf ")
    author2.create_profile(
      email: "swolf@keeling.name", 
      username: "sonyaw", 
      bio: "Park bespoke diy selfies leggings shabby chic kombucha taxidermy.", 
      avatar_url: "https://robohash.org/eosdoloremest.png?size=300x300&set=set1"
    )
    
    post1 = author1.posts.create(
      title: "A Monstrous Regiment of Women", 
      content: "Stumptown photo booth chartreuse next level biodiesel. Park narwhal cronut hammock helvetica."
    )
    post1.tags.create(name: "repellat")
    post1.tags.create(name: "qui")
    
    post2 = author1.posts.create(
      title: "Clouds of Witness", 
      content: "Selfies pickled crucifix offal. Celiac art party godard narwhal retro freegan selvage gastropub. Leggings brunch biodiesel gastropub schlitz cold-pressed truffaut. Master hoodie chia banh mi offal knausgaard yolo. Authentic selfies twee pabst tumblr. Freegan keffiyeh cliche gastropub. Yr vinyl cliche synth freegan forage. Biodiesel food truck fixie lo-fi 8-bit drinking neutra."
    )
    post2.tags.create(name: "qui")
    post2.tags.create(name: "facere")

    post3 = author2.posts.create(
      title: "Antic Hay", 
      content: "Typewriter neutra five dollar toast plaid. Polaroid tumblr put a bird on it."
    )
    post3.tags.create(name: "occaecati")
  end

  let!(:a1) { Author.first }
  let!(:a2) { Author.second }
  let!(:p1) { Post.first }
  let!(:p2) { Post.second }

  describe "GET /authors" do
    
    it "includes each author's name" do
      get "/authors"
      expect(response.body).to include_json([
        {
          name: a1.name
        },
        {
          name: a2.name
        }
      ])
    end

    it "does not include the author's id or timestamps" do
      get "/authors"
      expect(response.body).not_to include_json([
        {
          id: a1.id,
          created_at: a_kind_of(String),
          updated_at: a_kind_of(String)
        },
        {
          id: a2.id,
          created_at: a_kind_of(String),
          updated_at: a_kind_of(String)
        }
      ])
    end

    it "includes each author's profile with the username, email, bio and avatar_url" do
      get "/authors"
      expect(response.body).to include_json([
        {
          profile: {
            username: a1.profile.username,
            email: a1.profile.email,
            bio: a1.profile.bio,
            avatar_url: a1.profile.avatar_url
          }
        }
      ])
    end

    it "does not include id or timestamps in the profile" do
      get "/authors"
      expect(response.body).not_to include_json([
        {
          profile: {
            id: a_kind_of(Integer),
            created_at: a_kind_of(String),
            updated_at: a_kind_of(String)
          }
        }
      ])
    end
    
    it "includes each post's title and short_content" do
      get "/authors"
      expect(response.body).to include_json([
        {
          posts: [
            {
              title: p1.title,
              short_content: "#{p1.content[0..39]}..."
            }
          ]
        }
      ])
    end

    it "includes each author's posts and their tags" do
      get "/authors"
      expect(response.body).to include_json([
        {
          posts: [
            {
              tags: [
                { name: p1.tags.first.name }
              ]
            },
            {
              tags: [
                { name: p2.tags.first.name }
              ]
            }
          ]
        }
      ])
    end
  end
  
  describe "GET /authors/:id" do
    it "includes the author's name" do
      get "/authors/#{a1.id}"
      expect(response.body).to include_json({
        name: a1.name
      })
    end

    it "includes the author's profile with the username, email, bio and avatar_url" do
      get "/authors/#{a1.id}"
      expect(response.body).to include_json({
        profile: {
          username: a1.profile.username,
          email: a1.profile.email,
          bio: a1.profile.bio,
          avatar_url: a1.profile.avatar_url
        }
      })
    end
    
    it "includes each post's title and short_content" do
      get "/authors/#{a1.id}"
      expect(response.body).to include_json({
        posts: [
          {
            title: p1.title,
            short_content: "#{p1.content[0..39]}..."
          }
        ]
      })
    end

    it "includes each author's posts and their tags" do
      get "/authors/#{a1.id}"
      expect(response.body).to include_json({
        posts: [
          {
            tags: [
              { name: p1.tags.first.name }
            ]
          },
          {
            tags: [
              { name: p2.tags.first.name }
            ]
          }
        ]
      })
    end

  end
end
