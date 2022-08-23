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
  query: "{ emailCollection { items { content } } }"
}
```

Result Expression:

```
{
  emailContent: body.data.emailCollection.items[1].content
}
```
