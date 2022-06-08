#!/usr/bin/env bash

set -o errexit
set -o pipefail
set -o errtrace


cd "tests/values"

for file in *yaml; do
	echo "helm ${file}"
	helm template ../../ -f "${file}" --include-crds --namespace test-namespace > "../outputs/${file}"
done
