# michael-palmes/homebrew-tap

Homebrew tap for Offsider.

```sh
brew install michael-palmes/tap/offsider
```

Offsider is shipped as a Developer ID signed, notarised arm64 tarball from [its releases](https://github.com/michael-palmes/offsider/releases) and requires Apple silicon, macOS 15 or later, and Xcode 26 or later.

## Verify an install

```sh
codesign -dv --verbose=4 "$(brew --prefix offsider)/libexec/offsider"
gh attestation verify "$(brew --cache michael-palmes/tap/offsider)" --repo michael-palmes/offsider
```

The formula is updated automatically by Offsider's release workflow.

Offsider is a fork of [AXe](https://github.com/cameroncooke/axe) by Cameron Cooke and is not endorsed by its author.

## Licence

MIT. See [LICENSE](LICENSE).
