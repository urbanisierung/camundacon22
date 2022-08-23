# Airtable

General

- RestConnector: Bearer Auth
- Name: `Airtable: Create new Record`
- Airtable: `https://airtable.com/app51ZlBFbv2jDJIX/tblD76NEla0VQoZ8d/viw2x6hjaTR8LOwle?blocks=hide`
- BaseId: `app51ZlBFbv2jDJIX`
- TableId: `participants`
- Authentication: `https://airtable.com/account`

Service Task Config

- URL: `https://api.airtable.com/v0/app51ZlBFbv2jDJIX/participants`
- Method: `POST`
- Authentication: Bearer Token: `secrets.AIRTABLE`
- Payload:

Payload:

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
