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
  name: data.name,
  p1: emailContent.p1,
  p2: emailContent.p2,
  p3: emailContent.p3,
  p4: emailContent.p4,
  linkSlideDeck: emailContent.linkSlideDeck,
  linkGithub: emailContent.linkGithub,
  linkBlog: emailContent.linkBlog,
  linkApp: emailContent.linkApp,
  ipfsHash: ipfsHash,
  chuckNorrisJoke: chuckNorrisJoke,
  cat: catImage
}
```
