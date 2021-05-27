require 'rails_helper'

RSpec.describe "Posts", type: :request do

  a1 = Author.first
  a2 = Author.second
  p1 = Post.first
  p2 = Post.second

  describe "posts index" do
    
    it "includes each post's title and content" do
      get "/posts"
      expect(response_body.first["title"]).to eq p1.title
      expect(response_body.first["content"]).to eq p1.content
      expect(response_body.second["title"]).to eq p2.title
      expect(response_body.second["content"]).to eq p2.content
    end

    it "does not include the posts' id's" do
      get "/posts"
      expect(response_body.first["id"]).not_to be_present
      expect(response_body.second["id"]).not_to be_present
    end

    it "does not include timestamps" do
      get "/posts"
      expect(response_body.first["created_at"]).not_to be_present
      expect(response_body.first["updated_at"]).not_to be_present
    end

    it "includes the name of the author" do
      get "/posts"
      expect(response_body.first["author"]["name"]).to eq p1.author.name
      expect(response_body.second["author"]["name"]).to eq p2.author.name
    end

    it "includes each post's tags" do
      get "/posts"
      expect(response_body.first["tags"].first["name"]).to eq p1.tags.first.name
      expect(response_body.second["tags"].first["name"]).to eq p2.tags.first.name
    end

  end
  
  describe "posts show" do
    
    it "includes each post's title and content" do
      get "/posts/#{p1.id}"
      expect(response_body["title"]).to eq p1.title
      expect(response_body["content"]).to eq p1.content
    end

    it "includes the name of the author" do
      get "/posts/#{p1.id}"
      expect(response_body["author"]["name"]).to eq p1.author.name
    end

    it "includes each post's tags" do
      get "/posts/#{p1.id}"
      expect(response_body["tags"].first["name"]).to eq p1.tags.first.name
    end

  end

  def response_body
    JSON.parse(response.body)
  end
end
