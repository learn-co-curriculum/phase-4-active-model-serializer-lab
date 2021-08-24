# Active Model Serializer Lab

## Learning Goals

- Use Active Model Serializer to render JSON
- Use Active Model Serializer to render JSON for associations

## Introduction

For this lab, we're going to return to our Blog application and update it to use
`ActiveModel::Serializer` for JSON serialization.

To set up the app, run:

```console
$ bundle install
$ rails db:migrate db:seed
$ rails s
```

Our app includes four resources: `Author`, `Profile`, `Post`, and `Tag`, as well
as a `post_tag` join table. All the associations have been set up, as well as
`index` and `show` routes and actions for each of the four resources.

Start by building the serializers based on the instructions below. Check your
work in the browser as you go. Then, run `learn test` to make sure your code
passes the tests.

## Instructions

### Author

Set up a serializer for `Author` that returns the following JSON:

1. The author's `name`
2. The author's `profile`, including only the `username`, `email`, `bio` and
   `avatar_url`
3. A list of the author's posts, including:

- the `title`
- the first 40 characters of the post's content as `short_content`, with a
  trailing ellipsis (`...`) at the end
- a list of the associated `tags`

**Note**: You will need to make serializers for the `Profile` and `Post` models
to get this working.

### Posts

Set up a serializer for the `Post` model that displays the following:

1. The post's `title` and `content`
2. The name of the author
3. The tags associated with the post

### Tags

Set up a serializer for `Tag` that displays the following:

1. The name of the tag
2. A list of the posts the tag is associated with
