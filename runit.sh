#!/bin/bash

RESPONSE_FILE=./response.json
GITHUB_TOKEN=

if [ ! -f $RESPONSE_FILE ]; then
  cat <<REQUEST_BODY |curl -s https://api.github.com/graphql -H "Authorization: bearer $GITHUB_TOKEN" -X POST -d @- > $RESPONSE_FILE
  {
    "query": "query {
      viewer {
        login
        starredRepositories(first: 30, orderBy: {field: STARRED_AT, direction: DESC}) {
          edges {
            node {
              owner {
                login
              }
              name
              description
              stargazers(first: 5) {
                edges {
                  node {
                    starredRepositories(first: 30, orderBy: {field: STARRED_AT, direction: DESC}) {
                      edges {
                        node {
                          owner {
                            login
                          }
                          name
                          description
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }"
  }
REQUEST_BODY
fi

read -r -d '' JQ_FILTER_STR <<-'JQ_FILTERS' || true
"NAME\tDESCRIPTION",
"-------\t-------------",
(
  .data.viewer.starredRepositories.edges
    | .[].node.stargazers.edges
    | .[].node.starredRepositories.edges
    | .[].node
    | .name + "\t" + .description
)
JQ_FILTERS

cat $RESPONSE_FILE \
  |jq -r "$JQ_FILTER_STR" \
  |column -t -s $'\t' \
  | awk 'NR<3{print $0;next}{print $0| "sort"}' |uniq
