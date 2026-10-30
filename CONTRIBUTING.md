# Contributing

## Rules

- Commit messages follow Conventional Commits, except the `<formula> <version>` commits that `bump.yml` pushes.

## Proposing a change

Open an issue before you start on a new formula or a change to `bump.yml`, with what it should do. The tap holds only yagipass tools. A small fix, such as a typo, can go straight to a pull request.

A pull request:

- references its issue (`Closes #N`).
- has a Conventional Commits title. Pull requests are squash-merged, so the title becomes the commit on `main`.

## Adding a formula

1. Release one binary per platform, named `<formula>-<platform>`. `bump.yml` ignores `<formula>-<platform>.sha256` checksum files next to them.
2. Add `Formula/<formula>.rb` like [`vbtm.rb`](Formula/vbtm.rb), with each `sha256` right after its `url`.
3. After uploading the binaries, call [`bump.yml`](.github/workflows/bump.yml) with a token that can push to this repository:

```yaml
homebrew:
  uses: yagipass/homebrew-tap/.github/workflows/bump.yml@main
  with:
    formula: <formula>
    tag: <tag>
  secrets:
    tap-token: ${{ secrets.HOMEBREW_TAP_TOKEN }}
```

`bump.yml` points the formula's URLs at the release, sets each `sha256` from the release assets, and pushes the change to `main` as `<formula> <version>`.

## Repository settings

The repository settings, labels, rulesets, and Actions permissions are managed with [gh-infra](https://github.com/babarot/gh-infra) in `.github/infra.yml`. To change them, edit the file, review the difference with `gh infra plan .github/infra.yml`, and apply it with `gh infra apply .github/infra.yml`. Applying needs admin access to the repository.

Environments and secrets are not managed by gh-infra. Change them in the repository settings on GitHub.
