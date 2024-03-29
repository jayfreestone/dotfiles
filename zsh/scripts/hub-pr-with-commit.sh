#!/usr/bin/env bash

# Usage: hub-pr-with-commit [PROJECT] SHA
# https://raw.githubusercontent.com/mislav/hub-api-utils/master/bin/hub-pr-with-commit
# Author: Fabio Rehm

set -e

PROJECT=
COMMIT=

project-from-remote() {
  git remote get-url "${1?}" | \
    grep -o 'github\.com[/:].\+' | \
    sed 's/github\.com.//; s/\.git$//'
}

if [ $# -eq 1 ]; then
  PROJECT="$(project-from-remote origin)"
  COMMIT="${1}"
  shift 1
elif [ $# -ge 2 ]; then
  PROJECT="${1}"
  COMMIT="${2}"
  shift 2
else
  echo "Usage: hub-pr-with-commit [PROJECT] SHA"
  exit 1
fi

hub api graphql -f q="${COMMIT} type:pr repo:${PROJECT}" "$@" -f query='
  query($q: String!) {
    search(query: $q, type: ISSUE, first: 3) {
      nodes {
        ... on PullRequest {
          url
          title
        }
      }
    }
  }
' | jq -r '.data.search.nodes[] | [.title, .url] | @tsv'
