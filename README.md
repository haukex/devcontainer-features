# Hauke's Features for Development Containers

[Development Containers](https://containers.dev/)

## Perl

Designed for Debian/Ubuntu and Alpine Linux.

Although Perl may already be preinstalled into many containers,
this feature provides a few things that make bootstrapping Perl projects easier:

- [`cpanm`](https://metacpan.org/dist/App-cpanminus/view/bin/cpanm) for package management
- [`local::lib`](https://metacpan.org/pod/local::lib) so modules can be installed into the user's home directory instead of the system Perl
- `IO::Socket::SSL`, so that Perl's core module [`HTTP::Tiny`](https://perldoc.perl.org/HTTP::Tiny) has SSL support
- `build-essential`/`build-base` to make sure compiler tools are available for installing modules
- `perl-doc` so `perldoc`/manpages are available

To use this, incorporate the following into your `devcontainer.json`
(where the `cpanm` command is of course optional depending on your project):

```jsonc
{
    "features": {
        "ghcr.io/haukex/devcontainer-features/perl:1": {}
    },
    "postCreateCommand": "cpanm --installdeps ."
}
```

If you don't want `local::lib`'s environment variables to be added to your `.bashrc`:

```jsonc
{
    "features": {
        "ghcr.io/haukex/devcontainer-features/perl:1": {
            "local_lib": false
        }
    }
}
```
