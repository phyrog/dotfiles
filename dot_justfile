repo_home := env_var("HOME") / "Projects"

@git-clone repo:
  path=$(just git-dir {{repo}}) && mkdir -p $(dirname "$path") && git clone {{repo}} $path && echo $path

git-dir repo:
  #!/usr/bin/env bash
  set -euo pipefail
  url=$(echo "{{repo}}" | tr ':' '/')
  url=${url#"https///"}
  url=${url#"git@"}
  url=${url%".git"}
  path="{{repo_home}}/$url"
  echo "$path"

