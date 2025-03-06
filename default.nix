{
  pkgs ? import <nixpkgs> {
    inherit system;
    overlays = [ ];
    config = { };
  },
  lib ? pkgs.lib,
  system ? builtins.currentSystem,
}:
let
  callPackage = lib.callPackageWith (pkgs // packages');

  packages' = lib.packagesFromDirectoryRecursive {
    directory = ./pkgs;
    inherit callPackage;
  };

  packages = builtins.mapAttrs (
    port: args: packages'.buildEvergardenPort ({ inherit port; } // args)
  ) (lib.importJSON ./pkgs/ports.json);
in
packages
