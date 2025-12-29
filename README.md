# Preferences

A remote copy of all my configurations to allow for better syncing between machines

## Instructions

On your machine, clone this repo to your preferred location. At the root directory, make sure you have a `.bash_profile` file and copy the following snippet into it:

```bash
test -f ~/{REPO_LOCATION}/preferences/.bash_profile && source ~/{REPO_LOCATION}/preferences/.bash_profile
```

Any machine-specific configurations needed can then be written below.

### Overrides

The git aliases have a variable called `DEFAULT_BRANCH`, which is set to `master` by default. For situations where the default branch is called `main` or something else, add the line below:

```bash
export DEFAULT_BRANCH=main
```

## Notes

If `zsh` is the current shell on the machine, run `chsh -s /bin/bash` to switch to `bash`.
