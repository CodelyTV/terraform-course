# infracost

## Checkout the base branch of the pull request (e.g. main/master).

```

- name: Checkout base branch
  uses: actions/checkout@v2
  with:
  ref: '${{ github.event.pull_request.base.ref }}'
```

## Generate Infracost JSON file as the baseline.

```

- name: Generate Infracost cost estimate baseline
  id: infracost-baseline
  run: |
  mkdir -p ${{ env.WORKING_DIR }}
    touch ${{ env.WORKING_DIR }}main.tf
    infracost breakdown --path=${{ env.WORKING_DIR }} \
   --format=json \
   --out-file=/tmp/infracost-base.json \
   --terraform-force-cli
```

## Checkout the current PR branch so we can create a diff.

```

- name: Checkout PR branch
  uses: actions/checkout@v3
```

## Generate an Infracost diff and save it to a JSON file.

```

- name: Generate Infracost diff
  run: |
  infracost diff --path=${{ env.WORKING_DIR }} \
   --format=json \
   --compare-to=/tmp/infracost-base.json \
   --out-file=/tmp/infracost.json
  infracost output --path /tmp/infracost.json --format table --out-file /tmp/report.table
  cat /tmp/report.table
```

## Post comment

```

- name: Post Infracost comment
  run: |
  infracost comment github --path /tmp/infracost.json \
   --repo $GITHUB_REPOSITORY \
   --github-token ${{ github.token }} \
   --pull-request ${{ github.event.pull_request.number }} \
   --behavior update
```
