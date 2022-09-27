# CamundaCon 22

- Title: 10 Things You Can Do with Camunda Cloud Without a Line of Code
- Description: I’m a fullstack developer – I love writing code to solve problems. I’m also a serverless fan and use SaaS products everywhere I don’t need production depth. What’s the link to Camunda Platform 8? Simple: with Cloud Connectors, you don’t need a line of code to interact with HTTP APIs. If you simply want to interact with an existing service, you don’t need a separate application. In this session, I’ll show you how it works with ten examples: I’ll integrate with Trello, Github, Hubspot, and more.

Slide Deck: [Google Slides](https://docs.google.com/presentation/d/1cpGLx0Tjv8akQNdu_OqxOLRtpG_kex8e2_s53zQY-y4/edit?usp=sharing)

## Todos

- Open a ticket: Trello and Github ✔
- Slack Notifications ✔
- Update Hubspot Contact Property ✔
- Send Analytics Events using Mixpanel ✔
- Add an table entry using Airtable ✔
- Store JSON Data using IPFS ✔
- Send an E-Mail using Sendgrid ✔
- Randomly select a cat picture using cats api ✔
- Get crypto asset price via coinmarketcap api (if you want to know the price for a current event, like a new signup)
- Create a welcome image using websiteshot api
- Get content from contentful ✔
- Check Noris Jokes? https://api.chucknorris.io/ - GET https://api.chucknorris.io/jokes/random?category=science

- Simple Frontend with three input fields:
  - Name
  - E-Mail
  - Did you like the talk?
- Use Rest Zeebe to start new process instance

### Nice Links

- Feel
  - Playground: https://nikku.github.io/feel-playground/
  - Docs: https://docs.camunda.io/docs/components/modeler/feel/language-guide/feel-temporal-expressions/

### Start Instance Payload

```json
{
  "data": {
    "name": "Adam",
    "email": "adam.urban@gmail.com",
    "id": "id-1662995640599",
    "now": 1662995640599
  }
}
```

### Chuck Norris Jokes

Service Task Config

- URL: `https://api.chucknorris.io/jokes/random`
- Method: `GET`
- Query:

```
{
  category: "science"
}
```

### Contentful

General

- Authentication: Settings / API-Keys

Service Task Config

- URL: `https://graphql.contentful.com/content/v1/spaces/:spaceId`
- Method: `POST`
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

- Hints
  - Feel Expression with Lists/Arrays start at index 1 and not at index 0

### Sendgrid

General

- Authentication: `https://app.sendgrid.com/settings/api_keys`

Service Task Config

- Sendgrid API Key: `"secrets.SENDGRID"`
- Receiver: `data.name` and `data.email`
- Template Id: `"secrets.SENDGRID_TEMPLATE"`
- Template Data:

```
{
  name: data.name
}
```

### The Cat API

General

Service Task Config

- URL: `https://api.thecatapi.com/v1/images/search`
- Method: `GET`

Response: `cat.body[1].url`

Example:

```json
[
  {
    "id": "dmr",
    "url": "https://cdn2.thecatapi.com/images/dmr.jpg",
    "width": 640,
    "height": 512
  }
]
```

### Mixpanel

General

- Authentication: Organization Settings / Service Accounts

Service Task Config

- URL: `https://api-eu.mixpanel.com/import`
- Method: `POST`
- Query:

```
{
  project_id: "secrets.MIXPANEL_PROJECT_ID"
}
```

- Payload:

```
[
  {
    event: "ccon22",
    properties: {
      time: data.now,
      $insert_id: data.id,
      distinct_id: data.email,
      name: data.name
    }
  }
]
```

- Hints
  - Mixpanel API: `api` vs `api-eu`
  - Mixpanel: using import API instead of track api because of auth via header
    - Project Tokens need to be set via Body data (`secrets` currently not supported)

### Trello

General

- Authentication: `https://trello.com/app-key`
  - Key and Token needed
- Get Board Id and List Id: `https://trello.com/b/QiVwTOFF/ccon22.json`
- BoardId: `62ff3b4c6fb0b936930eea65`
- ListId: `62ff3b5d7651bd19ae07d45c`

Service Task Config

- URL: `https://api.trello.com/1/cards`
- Method: `POST`
- Query:

```
{
  key: "secrets.TRELLO_KEY",
  token: "secrets.TRELLO_TOKEN",
  idList: "62ff3b5d7651bd19ae07d45c",
  name: "Hi, "+data.name+"!"
}
```

- Hints
  - Get Board and List Id via `.json` url

### Slack

General

- Authentication: New Incoming Webhook

Service Task Config

- URL: `https://hooks.slack.com/services/:webhookid` / `"secrets.SLACK"`
- Method: `POST`
- Payload:

```
{
  blocks: [
    {
      type: "section",
      text: {
        type: "mrkdwn",
        text: "Welcome, "+data.name+"!"
      }
    }
  ]
}
```

- Hints
  - make sure to use double quotes for `secrets.SLACK` in URL

Response:

### Hubspot

General

- Authentication: Settings / Account Setup / Integrations / Private Apps

Service task Config

- URL: `https://api.hubapi.com/contacts/v1/contact/createOrUpdate/email/:email`
- Method: `POST`
- Authentication: Bearer Token: `secrets.HUBSPOT`
- Payload:

```
{
  properties: [
    {
      property: "firstname",
      value: data.name
    }
  ]
}
```

### Airtable

General

- Airtable: `https://airtable.com/app51ZlBFbv2jDJIX/tblD76NEla0VQoZ8d/viw2x6hjaTR8LOwle?blocks=hide`
- BaseId: `app51ZlBFbv2jDJIX`
- TableId: `participants`
- Authentication: `https://airtable.com/account`

Service Task Config

- URL: `https://api.airtable.com/v0/app51ZlBFbv2jDJIX/participants`
- Method: `POST`
- Authentication: Bearer Token: `secrets.AIRTABLE`
- Payload:

```
{
  records: [
    {
      fields: {
        Name: "Adam",
        email: "adam.urban@gmail.com",
        Status: "Todo"
      }
    }
  ]
}
```

With context payload:

```
{
  records: [
    {
      fields: {
        Name: data.name,
        email: data.email,
        Status: "Todo"
      }
    }
  ]
}
```

### Web3.Storage

General

- Authentication: `https://web3.storage/tokens/`

Service Task Config

- URL: `https://api.web3.storage/upload`
- Method: `POST`
- Authentication: Bearer Token: `secrets.WEB3STORAGE`
- Payload:

```
{
  content: {
    name: data.name,
    text: "Hey there! I hope you had a lot of fun at CamundaCon 22!"
  }
}
```

Response: `cid`

Gateway: `https://gateway.ipfs.io/ipfs/:hash`
Example: `https://gateway.ipfs.io/ipfs/bafkreib2ur773sls3p5e2yu26sc43olgrf5ckkgjple3ss4ucq47udephq`

### Other

- Gradient Gifs
  - https://giphy.com/explore/gradient
  - https://giphy.com/search/hypnotizing
- Google Slides Dimensions: 16:9 / 960x540 --> 480x540

### Images

- Welcome a customer
  - https://unsplash.com/photos/oTweoxMKdkA / https://unsplash.com/@brookecagle
  - https://unsplash.com/photos/POzx_amnWJw / https://unsplash.com/@claybanks
  - https://unsplash.com/photos/95UF6LXe-Lo / https://unsplash.com/@charlesetoroma
- sport
  - https://unsplash.com/photos/-6GinD-1NwE / https://unsplash.com/@cchau
  - https://unsplash.com/photos/8Naac6Zpy28 / https://unsplash.com/@matt909
  - https://unsplash.com/photos/SE9bKjzr1Eg / https://unsplash.com/@davidutt36
  - https://unsplash.com/photos/x5GcXFvJJhI / https://unsplash.com/@peterampazzo
