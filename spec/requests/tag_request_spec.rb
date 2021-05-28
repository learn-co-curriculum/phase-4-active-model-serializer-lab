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

  describe "tags index" do
    
    it "includes each tag's name" do
      get "/tags"
      expect(response_body.first["name"]).to eq t1.name
    end

    it "does not include the tag id's or timestamps" do
      get "/tags"
      expect(response_body.first["id"]).not_to be_present
      expect(response_body.first["created_at"]).not_to be_present
      expect(response_body.first["updated_at"]).not_to be_present
    end

    it "includes a list of the posts the tag is associated with" do
      get "/tags"
      expect(response_body.first["posts"].first["title"]).to eq p1.title
      expect(response_body.first["posts"].first["content"]).to eq p1.content
    end

  end
  
  def response_body
    JSON.parse(response.body)
  end
end
