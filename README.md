# nix-flakes
Common nix flakes I am using for development. Nothing here is supposed to be the *nix-way* but to give  a development environment wich works on NixOS as fast as possible. Tested on NixOS 25.11.

# Usage 

```bash
nix develop github:mmxgn/nix-flakes?dir=<template>
```

E.g. for a simple Python 3.11 FHS environment:

```
nix develop github:mmxgn/nix-flakes?dir=python311-fhs
python -m venv .venv 
. .venv/bin/activate

# Do your python development here, e.g. 
pip install torch jupyterlab
```


# Envrionments

## `python-311-fhs`

A simple Python 3.11 flake in an FHS environment, with `virtualenv`, `pip`, and some libraries for use with pytorch for ML development. 
