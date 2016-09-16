Answers the question:

```
Starting with other Github users who have starred the same repos I have, what
other repos have these users starred that I might be interested in?
```

Utilizes the shiny brand new GraphQL Github API (need to opt-in to early access
program currently)

The setup process is a bit rough at the moment:
* hand-edit ./runit.sh and plug in your Github personal access token for the
  GITHUB_TOKEN environment variable

To run it:
```
./runit.sh
```
* The first time through it will make a curl request to Githubs GraphQL API to get
data and it will write it to a local response.json file.
* The contents of the local response.json file will be piped through formatting
utilities to produce a simple 2-column, tabular display containing repo name
and description
* On subsequent runs if the cached response.json file exists in the current
directory, the call to query the GitHub API is skipped and the cached data is
displayed
