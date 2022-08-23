# Hubspot

General

- Authentication: Settings / Account Setup / Integrations / Private Apps

Service task Config

- RestConnector: Bearer Auth
- Name: `Hubspot: Create contact`
- URL: `"https://api.hubapi.com/contacts/v1/contact/createOrUpdate/email/"+data.email`
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
