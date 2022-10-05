# Dotfiles
This repo installs basic config that I use across multiple machines. It leverages
[chezmoi](https://www.chezmoi.io/) to install.

## Installation Instructions
Install chezmoi and your dotfiles on a new machine with a single command.

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --apply johnnyfleet`

For setting up transitory environments (e.g. short-lived Linux containers) you can install chezmoi, install your dotfiles, and then remove all traces of chezmoi, including the source directory and chezmoi's configuration directory, with a single command:

`sh -c "$(curl -fsLS https://chezmoi.io/get)" -- init --one-shot johnnyfleet`
