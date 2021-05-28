# Active Model Serializer Lab

## Learning Goals

- Use Active Model Serializer to render JSON
- Use Active Model Serializer to render JSON for associations

## Introduction

For this lab, we're going to return to our Blog application and update it to use
`ActiveModel::Serializer` for JSON serialization.

To set up the app, run:

```sh
bundle install
rails db:migrate db:seed
rails db:seed RAILS_ENV=test
rails s
```

Our app includes four resources: `Author`, `Profile`, `Post`, and `Tag`, as well
as a `post_tag` join table. All the associations have been set up, as well as
`index` and `show` routes and actions for each of the four resources.

## Instructions

### Author

Set up a serializer for `Author` that returns the following JSON:

1. The author's name
2. The author's profile
3. A list of the author's posts, including:
  - the title
  - the first 40 characters of the content
  - a list of the associated tags

### Profile

1. Profiles are currently provided using the `profiles` and `profiles/:id`
   routes. Instead, we want to only provide the profile along with the author it
   belongs to
2. The JSON should include only `username`, `email`, `bio` and `avatar_url`

### Posts

Set up a serializer for `Post` that displays the following:

1. The post's `title` and `content`
2. The name of the author
3. The tags associated with the post

### Tags

Set up a serializer for `Tag` that displays the following:

1. The name of the tag
2. A list of the posts the tag is associated with
