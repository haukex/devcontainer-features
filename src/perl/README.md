
# Perl (perl)

Larry Wall's Practical Extraction und Report Language

## Example Usage

```json
"features": {
    "ghcr.io/haukex/devcontainer-features/perl:1": {}
}
```

## Options

| Options Id | Description | Type | Default Value |
|-----|-----|-----|-----|
| local_lib | Whether to initialize local::lib in .bashrc | boolean | true |

## Description

Currently supports Debian/Ubuntu and Alpine Linux.

Although Perl may already be preinstalled into many containers,
this feature adds a few things that make bootstrapping Perl projects easier:

- [`cpanm`](https://metacpan.org/dist/App-cpanminus/view/bin/cpanm) for package management
- [`local::lib`](https://metacpan.org/pod/local::lib), so CPAN modules can be installed into
  the user's home directory without root instead of the system Perl
  - `local::lib` initialization is added to the user's `.bashrc` (can be disabled)
- `IO::Socket::SSL`, so that Perl's core module
  [`HTTP::Tiny`](https://perldoc.perl.org/HTTP::Tiny) has SSL support
- `build-essential`/`build-base` for basic compiler tooling for Perl module installation
  (may already be preinstalled on many containers)
- `perl-doc` so `perldoc`/manpages are available

Please note that this feature uses whatever version of `perl` and the above modules that
is available through the system's package manager. If you need a specific version of Perl,
consider using e.g. [Perlbrew](https://perlbrew.pl/) or an
[official Perl Docker image](https://hub.docker.com/_/perl).

Example [`devcontainer.json`](https://aka.ms/devcontainer.json):

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


---

_Note: This file was auto-generated from the [devcontainer-feature.json](https://github.com/haukex/devcontainer-features/blob/main/src/perl/devcontainer-feature.json).  Add additional notes to a `NOTES.md`._
