# homebrew-tap

Personal Homebrew tap.

```sh
brew tap stigvoss/tap
brew install --cask stigvoss/tap/rapidraw
```

Homebrew autobump checks the `rapidraw` cask for updates every two hours via
`.github/workflows/update-rapidraw.yml`. The workflow can also be run manually
with an optional `casks` input (defaults to `rapidraw`). It requires a `BOT_TOKEN`
secret with permissions to push updates and open pull requests.
