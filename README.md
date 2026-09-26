# bar-nothing-ranch

Contaner wrangling for pets and cattle

## Introduction

`bar-nothing-ranch` is a set of Podman-based scripts for
managing a collection (pod) of containers. There are two
kinds of container:

- Cattle: single-service containers that can come and go. The
are usually based on third-party offerings like AI inference
servers / studios, and

- Pets: command line virtual-machine-like servers you can log
into, but share nothing with your host you haven't explicitly
allowed. Think of it as a Distrobox with more isolation from
your desktop environment.

## Current denizens of the ranch

- bar-nothing-ranch: this is the pod. All the other containers
belong to this pod.

- three-l-lllama: this is a pet container with a Debian `trixie`
base, a Homebrew command line featuring NeoVim, AI agents, Lua,
LLVM and the Terra language.

- R-AI-D: an RStudio and `ssh` server based on Fedora stable
(currently Fedora 44). Like `three-l-lllama`, `R-AI-D` contains
a Homebrew command line with NeoVim and AI agents.

- Unsloth Studio: this is a container running the Unsloth Studio
Docker image.
- CLAMS-devel: this is a minimalist container running Alpine Linux
`edge` for cross-development of embedded computer music
applications.
