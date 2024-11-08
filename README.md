# LearnTeachCode Workspace (Kasm Image)

![Screenshot of ltc-workspace-image with fairy penquins wallpaper](./screenshot-of-ltc-workspace-image-with-fairy-penguins-wallpaper.png)
[Fairy penguins](https://www.flickr.com/photos/45958245@N00/2802087983) (wallpaper) image by rumpleteaser CC-BY-2.0  [CC-BY-2.0](https://creativecommons.org/licenses/by/2.0/).

## Introduction

This repo provides a workspace for the [LearnTeachCode resource page](https://github.com/LearnTeachCode/code-coffee-compendium/) based on the Ansible template for [KASM Ubuntu Jammy Images](https://hub.docker.com/r/kasmweb/core-ubuntu-jammy), template originally provided by @j-simmons-phd.  The workspace is configured with the following software:

- Node JS Tools
    - nodejs v20.15.1
    - npm v10.7.0 (included with nodejs)
    - npx v10.7.0 (included with nodejs)
    - yarn v4.3.1
    - oclif v4.14.6
- Utilities
    - git v2.43.0 with @capsulecorplab .gitconfig
    - [Keychain](https://www.funtoo.org/Keychain) v2.8.5
    - Vim (pre-installed) with @capsulecorplab [vimrc](https://gist.github.com/capsulecorplab/495058e7a57ed8adaed3c40c80d09739#file-vimrc)
- Python 3.12.3 (part of the image template) with the following packages (not part of the image template)
    - pip
    - [JupyterLab](https://jupyter.org/)
    - [Jupyter Notebook](https://jupyter.org/)
    - [Voilà](https://voila.readthedocs.io/en/stable/index.html)
    - [Pint](https://pint.readthedocs.io/en/stable/)
- VS Code with the following extensions (note, auto-updates are disabled)
    - [Python extension by Microsoft](https://marketplace.visualstudio.com/items?itemName=ms-python.python)
    - [Dendron](https://marketplace.visualstudio.com/items?itemName=dendron.dendron)
    - [Foam](https://marketplace.visualstudio.com/items?itemName=foam.foam-vscode)
- Content Viewers
    - Chrome
    - Firefox

## How to Use this Repo

1. Clone and change directory into this repo
1. Run `docker-compose pull` to download the image or run `docker-compose build` to build the workspace image locally

## Using the image locally

Once built, the image can be pushed into the Kasm server per Kasm documentation or it can be run locally on port 6901 using docker-compose.

- **Starting the image locally:** Run `docker-compose up`
- **Stopping the image locally:** Run `docker-compose down`

When running locally, the workspace can be accessed at https://localhost:6901 with
- **User:** `kasm_user`
- **Passwordd:** `password`
