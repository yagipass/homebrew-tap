# yagipass/homebrew-tap

```sh
brew install yagipass/tap/vbtm
```

| Formula | Description |
|---|---|
| [`vbtm`](https://github.com/yagipass/verbatime) | Reads .vbtm recordings and shows where the time went |

## Adding a formula

1. Release one binary per platform, named `<formula>-<platform>`. `bump.yml` ignores
   `<formula>-<platform>.sha256` checksum files next to them.
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
