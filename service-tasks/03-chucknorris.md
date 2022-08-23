# Chuck Norris

Service Task Config

- RestConnector: No Auth
- Name: `Chuck Norris Joke`
- URL: `https://api.chucknorris.io/jokes/random`
- Method: `GET`
- Query:

```
{
  category: "science"
}
```

- Result Expression:

```
{
  chuckNorrisJoke: body.value
}
```
