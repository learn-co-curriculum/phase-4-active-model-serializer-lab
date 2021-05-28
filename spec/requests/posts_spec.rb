require 'rails_helper'

RSpec.describe "Posts", type: :request do

  before do 
    author1 = Author.create(name: "Wilbert Green")
    
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
  end

  let!(:p1) { Post.first }
  let!(:p2) { Post.second }

  describe "GET /posts" do
    
    it "includes each post's title and content" do
      get "/posts"
      expect(response.body).to include_json([
        {
          title: p1.title,
          content: p1.content
        },
        {
          title: p2.title,
          content: p2.content
        }
      ])
    end

    it "does not include the posts' ids or timestamps" do
      get "/posts"
      expect(response.body).not_to include_json([
        {
          id: p1.id,
          created_at: a_kind_of(String),
          updated_at: a_kind_of(String)
        },
        {
          id: p2.id,
          created_at: a_kind_of(String),
          updated_at: a_kind_of(String)
        }
      ])
    end

    it "includes the name of the author" do
      get "/posts"
      expect(response.body).to include_json([
        {
          author: {
            name: p1.author.name
          }
        },
        {
          author: {
            name: p2.author.name
          }
        }
      ])
    end

    it "includes each post's tags" do
      get "/posts"
      expect(response.body).to include_json([
        {
          tags: [
            {
              name: p1.tags.first.name
            }
          ]
        },
        {
          tags: [
            {
              name: p2.tags.first.name
            }
          ]
        }
      ])
    end

  end
  
  describe "GET /posts/:id" do
    it "includes each post's title and content" do
      get "/posts/#{p1.id}"
      expect(response.body).to include_json({
        title: p1.title,
        content: p1.content
      })
    end

    it "includes the name of the author" do
      get "/posts/#{p1.id}"
      expect(response.body).to include_json({
        author: {
          name: p1.author.name
        }
      })
    end

    it "includes each post's tags" do
      get "/posts/#{p1.id}"
      expect(response.body).to include_json({
        tags: [
          {
            name: p1.tags.first.name
          }
        ]
      })
    end

  end
end
