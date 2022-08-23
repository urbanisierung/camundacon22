# SendGrid

General

- Authentication: `https://app.sendgrid.com/settings/api_keys`

Service Task Config

- SendGrid Connector
- Name: `SendGrid: Send E-Mail`
- Sendgrid API Key: `"secrets.SENDGRID"`
- Sender: `Adam` / `adam@web3nao.xyz`
- Receiver: `data.name` and `data.email`
- Template Id: `"secrets.SENDGRID_TEMPLATE"`
- Template Data:

```
{
  name: data.name
}
```
