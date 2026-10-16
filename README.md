# homebrew-tap

Personal Homebrew tap.

```sh
brew tap stigvoss/tap
brew install --cask stigvoss/tap/rapidraw
```

Homebrew autobump checks the `rapidraw` cask for updates every two hours via
`.github/workflows/autobump.yml`. The workflow can also be run manually
with an optional `casks` input (defaults to `rapidraw`). It requires an `AUTOBUMP_TOKEN`
secret with permissions to push updates and open pull requests.

## Autobump permissions setup

1. Sign in to the GitHub account that will open bump PRs. Homebrew's bump action
   uses a fork by default, so this account must be able to fork this public
   repository, push branches to its fork, and open PRs against this repository.
2. In the account's **Settings > Developer settings > Personal access tokens >
   Tokens (classic)**, generate a token with an expiration and the **`public_repo`**
   scope. This permits fork updates and PR creation for public repositories;
   it grants access to all public repositories the account can write to, so use
   a dedicated bot account if possible. The broader `repo`, `workflow`, and
   administration scopes are not needed for this public tap.
3. In this repository's **Settings > Environments**, create or select
   **`github_actions`**. Add an environment secret named **`AUTOBUMP_TOKEN`** with
   the token as its value. Ensure the environment's deployment branch rules
   allow the branch running the workflow; required reviewers will pause
   scheduled runs until approved.
4. Keep the workflow's `permissions: contents: read` setting. Write operations
   use `AUTOBUMP_TOKEN`, not the default `GITHUB_TOKEN`, so neither read/write workflow
   permissions nor **Allow GitHub Actions to create and approve pull requests**
   is required for the default token.
5. Run **Bump rapidraw cask on schedule or request** from the **Actions** tab to
   verify access. Check the **Bump rapidraw** step's logs even if the run is
   green: bump errors are allowed by `continue-on-error`. Rotate the secret
   before its token expires.
