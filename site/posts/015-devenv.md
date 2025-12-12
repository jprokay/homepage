---
title: devenv - The best tool for the job
date: 2025-12-12
tags: devenv, dev tools, productivity 
description: >
  You start a new project, you open up the README, and
  begin going through all the installation instructions.
  Oops someone forgot to document a dependency! What if you could
  get rid of this problem entirely? What if setting up a project
  just required you to open it up?
---

I cannot recall when I discovered [devenv](https://devenv.sh/); it's been at
least a year at this point. devenv offers "fast, declarative, reproducible, and
composable developer environments" which undersells how useful the service is for
developers.

With devenv I have a single place to:
- Declare external dependencies to packages in the massive [NixOS Package Manager](https://search.nixos.org/packages?channel=25.11&query=claude)
- Manage precommit hooks
- Set up services like a database and redis
- Centralize environment variables
- Maintain scripts and tasks for common actions

Whenever I make a change to my `devenv.nix`, my isolated environment, powered by Nix, is immediately updated
to match the desired state I declared in the file. For teams, all someone has to do is [set up devenv](https://devenv.sh/getting-started/)
then _cd into the project directory_ which immediately triggers installation of all necessary packages.

No more arguments needed about Makefile vs. Justfile. No more maintaining docker compose files just to run a database and redis for
development. Installation instructions are typically neglected until the next unfortunate soul onboards to discover just how bad the
situation is. If you are lucky, they decide to update it for you. With devenv, that problem is pretty much gone. Every project has
its own configuration that is isolated to that area of the filesystem. When I leave the directory, the environment is gone - the dependencies
are not polluting my global environment. I don't even need `nvm` or `pipenv` or `mise` or `asdf` (although mise and asdf are great!)
anymore as `devenv` already handles language version management too.

Check out [this snippet of a devenv.nix file from one of my projects.](/public/post015/devenv.nix) It sets up a database, a reverse proxy so
I can test locally with HTTPS, Redis, and more. And I know I have barely scratched the surface of what I can do with devenv.

There are [ways to build OCI Containers from your configuration](https://devenv.sh/containers/). [Profiles](https://devenv.sh/profiles/),
[Overlays](https://devenv.sh/overlays/), and even setup to to manage [Claude Code with devenv!](https://devenv.sh/integrations/claude-code/#examples)

However, I do want to call out that my difficulties when testing in GitHub Actions. Setting up `devenv` is painfully slow. The company who built the service, cachix,
is a provider of [binary caching services](https://devenv.sh/binary-caching/) that are meant to speed things up when deploying the same environment in
different places, which I think is what I have to do for CI.

I do not want to pay the $X/mo. for that service right now, so my CI setup is woefully archaic. Shoutout to [turborepo](https://turborepo.com/)
for simplifying that step!

If you are tired of juggling tools and dependencies, then hopefully this sells you on one of the last tools you really, truly need.


