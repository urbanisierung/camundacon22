# Mixpanel

General

- Authentication: Organization Settings / Service Accounts

Service Task Config

- RestConnector: Basic Auth
- Name: `Mixpanel: Import Event`
- URL: `https://api-eu.mixpanel.com/import`
- Method: `POST`
- Query:

```
{
  project_id: "secrets.MIXPANEL_PROJECT_ID"
}
```

- Authentication:

  - Username: `"secrets.MIXPANEL_USERNAME"`
  - Password: `"secrets.MIXPANEL_SECRET"`

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
