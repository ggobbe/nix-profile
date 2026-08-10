# Helix

This flake uses Helix's upstream flake so it includes fixes before the next tagged release.

## Update

```sh
nix flake update helix
nix --accept-flake-config profile upgrade nix-ggobbe
hx --version
```

The TypeScript 7 diagnostic fix was merged in Helix commit `25e92c249f4606f9fb5ed336d4ce57a385f2947b`.

`--accept-flake-config` enables Helix's Cachix cache, avoiding a local build of its grammars.
