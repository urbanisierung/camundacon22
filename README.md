# CamundaCon 22

- Title: 10 Things You Can Do with Camunda Cloud Without a Line of Code
- Description: I’m a fullstack developer – I love writing code to solve problems. I’m also a serverless fan and use SaaS products everywhere I don’t need production depth. What’s the link to Camunda Platform 8? Simple: with Cloud Connectors, you don’t need a line of code to interact with HTTP APIs. If you simply want to interact with an existing service, you don’t need a separate application. In this session, I’ll show you how it works with ten examples: I’ll integrate with Trello, Github, Hubspot, and more.

## Todos

- Open a ticket: Trello and Github
- Slack Notifications ✔
- Update Hubspot Contact Property ✔
- Send Analytics Events using Mixpanel
- Add an table entry using Airtable ✔
- Store JSON Data using IPFS ✔
- Send an E-Mail using Sendgrid
- Randomly select a cat picture using cats api
- Get crypto asset price via coinmarketcap api (if you want to know the price for a current event, like a new signup)
- Create a welcome image using websiteshot api

### Start Instance Payload

```json
{
  "data": {
    "name": "Adam",
    "email": "adam.urban@gmail.com"
  }
}
```

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

### Slack

General

- Authentication: New Incoming Webhook

Service Task Config

- URL: `https://hooks.slack.com/services/:webhookid`
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
