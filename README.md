# Hauke's Features for [Development Containers](https://containers.dev/)

For use in e.g. [GitHub Codespaces](https://github.com/features/codespaces).

## Perl

Currently supports Debian/Ubuntu and Alpine Linux.

Although Perl may already be preinstalled into many containers,
this feature adds a few things that make bootstrapping Perl projects easier:

- [`cpanm`](https://metacpan.org/dist/App-cpanminus/view/bin/cpanm) for package management
- [`local::lib`](https://metacpan.org/pod/local::lib) so CPAN modules can be installed into
  the user's home directory without root instead of the system Perl
- `IO::Socket::SSL`, so that Perl's core module
  [`HTTP::Tiny`](https://perldoc.perl.org/HTTP::Tiny) has SSL support
- `build-essential`/`build-base` for basic compiler tooling for Perl module installation
  (may already be preinstalled on many containers)
- `perl-doc` so `perldoc`/manpages are available

Please note that this feature uses whatever version of `perl` and the above modules that
is available through the system's package manager. If you need a specific version of Perl,
consider using e.g. [Perlbrew](https://perlbrew.pl/) or a
[official Perl Docker image](https://hub.docker.com/_/perl).

To use this, incorporate the following into your
[`devcontainer.json`](https://aka.ms/devcontainer.json):

```jsonc
{
    // use whatever Debian/Ubuntu/Alpine base image you like here:
    "image": "mcr.microsoft.com/devcontainers/base:debian",
    "features": {
        "ghcr.io/haukex/devcontainer-features/perl:1": {}
    },
    // optional depending on your project:
    "postCreateCommand": "cpanm --installdeps ."
}
```

If you don't want `local::lib`'s environment variables to be added to your `.bashrc`,
you may add the `"local_lib": false` option.
