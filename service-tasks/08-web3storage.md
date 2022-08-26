# Web3 Storage

General

- Authentication: `https://web3.storage/tokens/`

Service Task Config

- RestConnector: Bearer Auth
- Name: `Web3.Storage: Upload Content`
- URL: `https://api.web3.storage/upload`
- Method: `POST`
- Authentication: Bearer Token: `secrets.WEB3STORAGE`
- Payload:

```
{
  content: {
    name: data.name,
    p1: emailContent.p1,
    p2: emailContent.p2,
    p3: emailContent.p3,
    p4: emailContent.p4,
    linkSlideDeck: emailContent.linkSlideDeck,
    linkGithub: emailContent.linkGithub,
    linkBlog: emailContent.linkBlog,
    chuckNorrisJoke: chuckNorrisJoke,
    cat: catImage
  }
}
```

Result Expression:

```
{
  ipfsHash: body.cid
}
```

Response: `cid`

Gateway: `https://gateway.ipfs.io/ipfs/:hash`
Example: `https://gateway.ipfs.io/ipfs/bafkreib2ur773sls3p5e2yu26sc43olgrf5ckkgjple3ss4ucq47udephq`
