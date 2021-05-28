require 'rails_helper'

RSpec.describe "Authors", type: :request do

  a1 = Author.first
  a2 = Author.second
  p1 = Post.first
  p2 = Post.second

  describe "authors index" do
    
    it "includes each author's name" do
      get "/authors"
      expect(response_body.first["name"]).to eq a1.name
      expect(response_body.second["name"]).to eq a2.name
    end

    it "does not include the author's id" do
      get "/authors"
      expect(response_body.first["id"]).not_to be_present
      expect(response_body.second["id"]).not_to be_present
    end

    it "does not include timestamps" do
      get "/authors"
      expect(response_body.first["created_at"]).not_to be_present
      expect(response_body.first["updated_at"]).not_to be_present
    end

    it "includes each author's profile" do
      get "/authors"
      expect(response_body.first["profile"]).to be_present
      expect(response_body.second["profile"]).to be_present
    end

    it "includes the username, email, bio and avatar_url in the author's profile" do
      get "/authors"
      expect(response_body.first["profile"]["username"]).to eq a1.profile.username
      expect(response_body.first["profile"]["email"]).to eq a1.profile.email
      expect(response_body.first["profile"]["bio"]).to eq a1.profile.bio
      expect(response_body.first["profile"]["avatar_url"]).to eq a1.profile.avatar_url
    end

    it "does not include id or timestamps in the profile" do
      get "/authors"
      expect(response_body.first["profile"]["id"]).not_to be_present
      expect(response_body.first["profile"]["created_at"]).not_to be_present
      expect(response_body.first["profile"]["updated_at"]).not_to be_present
    end
    
    it "includes each author's posts and their tags" do
      get "/authors"
      expect(response_body.first["posts"]).to be_present
      expect(response_body.first["posts"].first["tags"]).to be_present
      expect(response_body.second["posts"]).to be_present
      expect(response_body.second["posts"].first["tags"]).to be_present
    end

    it "includes each post's title and short_content" do
      get "/authors"
      expect(response_body.first["posts"].first["title"]).to eq p1.title
      expect(response_body.first["posts"].first["short_content"]).to eq "#{p1.content[0..39]}..."
    end

    it "includes each post's tags" do
      get "/authors"
      expect(response_body.first["posts"].first["tags"].first["name"]).to eq p1.tags.first.name
      expect(response_body.first["posts"].second["tags"].first["name"]).to eq p2.tags.first.name
    end

  end
  
  describe "authors show" do
    it "includes the author's name" do
      get "/authors/#{a1.id}"
      expect(response_body["name"]).to eq a1.name
    end

    it "includes the author's profile" do
      get "/authors/#{a1.id}"
      expect(response_body["profile"]).to be_present
    end

    it "includes the username, email, bio and avatar_url in the author's profile" do
      get "/authors/#{a1.id}"
      expect(response_body["profile"]["username"]).to eq a1.profile.username
      expect(response_body["profile"]["email"]).to eq a1.profile.email
      expect(response_body["profile"]["bio"]).to eq a1.profile.bio
      expect(response_body["profile"]["avatar_url"]).to eq a1.profile.avatar_url
    end
    
    it "includes each author's posts and their tags" do
      get "/authors/#{a1.id}"
      expect(response_body["posts"]).to be_present
      expect(response_body["posts"].first["tags"]).to be_present
    end

    it "includes each post's title and short_content" do
      get "/authors/#{a1.id}"
      expect(response_body["posts"].first["title"]).to eq a1.posts.first.title
      expect(response_body["posts"].first["short_content"]).to eq "#{a1.posts.first.content[0..39]}..."
    end

    it "includes each post's tags" do
      get "/authors/#{a1.id}"
      expect(response_body["posts"].first["tags"].first["name"]).to eq a1.posts.first.tags.first.name
    end
  end

  def response_body
    JSON.parse(response.body)
  end
end
