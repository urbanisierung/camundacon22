# Contentful

General

- Authentication: Settings / API-Keys

Service Task Config

- RestConnector: Bearer Auth
- Name: `Contentful: Get Content`
- URL: `https://graphql.contentful.com/content/v1/spaces/ebynfcaufl0v`
- General URL: `https://graphql.contentful.com/content/v1/spaces/:spaceId`
- Method: `POST`
- Bearer Token: `secrets.CONTENTFUL`
- Payload:

```
{
  query: "{ emailCollection(order: [order_ASC]) { items { content } } }"
}
```

Result Expression:

```
{
  emailContent: {
    p1: body.data.emailCollection.items[1].content,
    p2: body.data.emailCollection.items[2].content,
    p3: body.data.emailCollection.items[3].content,
    p4: body.data.emailCollection.items[4].content,
    linkSlideDeck: body.data.emailCollection.items[5].content,
    linkGithub: body.data.emailCollection.items[6].content,
    linkBlog: body.data.emailCollection.items[7].content
  }
}
```
