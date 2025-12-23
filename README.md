## Preferences

A remote copy of all my configurations to allow for better syncing between machines

### Instructions

On your machine, clone this repo to your preferred location. At the root directory, make sure you have a `.bash_profile` file and copy the following snippet into it:

```
test -f ~/{REPO_LOCATION}/preferences/.bash_profile && source ~/{REPO_LOCATION}/preferences/.bash_profile
```

Any machine-specific configurations needed can then be written below.

### Notes

If `zsh` is the current shell on the machine, run `chsh -s /bin/bash` to switch to `bash`.
