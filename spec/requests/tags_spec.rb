require 'rails_helper'

RSpec.describe "Tags", type: :request do

  before do
    author1 = Author.create(name: "Wilbert Green")
    post1 = author1.posts.create(title: "A Monstrous Regiment of Women", content: "Stumptown photo booth chartreuse next level biodiesel. Park narwhal cronut hammock helvetica.")
    post1.tags.create(name: "repellat")
    post1.tags.create(name: "qui")
  end

  let!(:p1) { Post.first }
  let!(:t1) { p1.tags.first }

  describe "GET /tags" do
    
    it "includes each tag's name" do
      get "/tags"
      expect(response.body).to include_json([
        {
          name: t1.name
        }
      ])
    end

    it "does not include the tag's id or timestamps" do
      get "/tags"
      expect(response.body).not_to include_json([
        {
          id: t1.id,
          created_at: a_kind_of(String),
          updated_at: a_kind_of(String)
        }
      ])
    end

    it "includes a list of the posts the tag is associated with" do
      get "/tags"
      expect(response.body).to include_json([
        {
          posts: [
            {
              title: p1.title,
              content: p1.content
            }
          ]
        }
      ])
    end

  end
  
end
