#!/usr/bin/env bash

set -euo pipefail

oblt-cli cluster create custom \
	--dry-run \
	--template serverless \
	--cluster-name-prefix=oblt-cli-buildkite-plugin \
	--parameters='{"ProjectType":"observability","Target":"qa","EphemeralCluster":"true"}' \
	--output-file="${PWD}/cluster-info.json"

buildkite-agent meta-data set cluster-name "$(jq -r .ClusterName "${PWD}/cluster-info.json")"