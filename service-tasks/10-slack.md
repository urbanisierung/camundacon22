# Slack

General

- Authentication: New Incoming Webhook

Service Task Config

- RestConnector: No Auth
- Name: `Slack: Send Message`
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
