<h3 align="center">
  <img src="https://codeberg.org/evergarden/.profile/raw/branch/main/assets/logo-circle.png" width="100" alt="Logo"/><br/>
  Evergarden for <a href="https://nixos.org">Nix</a>
</h3>

<p align="center">
  <a href="https://codeberg.org/evergarden/nix/stars">
    <img src="https://img.shields.io/gitea/stars/evergarden/nix?style=for-the-badge&colorA=2B3337&colorB=F5D098&gitea_url=https%3A%2F%2Fcodeberg.org">
  </a>
  <a href="https://codeberg.org/evergarden/nix/issues">
    <img src="https://img.shields.io/gitea/issues/open/evergarden/nix?style=for-the-badge&colorA=2B3337&colorB=F7A182&gitea_url=https%3A%2F%2Fcodeberg.org">
  </a>
  <a href="https://codeberg.org/evergarden/nix/activity/contributors">
    <img src="https://img.shields.io/github/contributors/everviolet/nix?style=for-the-badge&colorA=2B3337&colorB=B3E6DB">
  </a>
</p>

### Usage

#### flakes

1. Add the flake

```nix
{
  inputs = {
    evergarden.url = "https://codeberg.org/evergarden/nix/archive/main.tar.gz";
  };
}
```

2. Add the modules you need

```nix
{ inputs, ... }:
{
  # you should only import these if you're system type allows for it
  imports = [
    inputs.evergarden.nixosModules.default
    inputs.evergarden.darwinModules.default
    inputs.evergarden.homeManagerModules.default
  ];
}
```

3. Enable the modules you want

```nix
{
  evergarden = {
    enable = true; # enable all modules
    variant = "winter";
    accent = "red";

    # you can also specifically disable modules
    alacritty.enable = false;

    # enable the cache
    cache.enable = true;
  };
}
```

#### classic nix

1. Add the repo

```nix
{
  evergarden = builtins.fetchTarball {
    url = "https://codeberg.org/evergarden/nix/archive/main.tar.gz";
    sha256 = "fill-in-the-sha256-hash";
  };
}
```

2. Add the modules you need

```nix
{ lib, ... }:
let
  # assumeing we have access to the evergarden from the previous step
  evgLib = import "${evergarden}/lib/default.nix" { inherit lib; };
in
{
  # you should only import these if you're system type allows for it
  imports = [
    (import "${evergarden}/modules/home-manager/default.nix" { inherit evgLib; })
  ];
}
```

3. Enable the modules you want

```nix
{
  evergarden = {
    enable = true; # enable all modules
    variant = "winter";
    accent = "red";

    # you can also specifically disable modules
    alacritty.enable = false;

    # enable the cache
    cache.enable = true;
  };
}
```


### Thanks to <3

- [isabelroses](https://github.com/isabelroses)
- [comfysage](https://codeberg.org/comfysage)

<hr>

<p align="center">
  <a href="https://codeberg.org/comfysage/evergarden/blob/mega/LICENSE">
    <img src="https://img.shields.io/static/v1.svg?style=for-the-badge&label=LICENSE&message=GPL3&colorA=2B3337&colorB=AFD9E6"/>
  </a>
</p>
