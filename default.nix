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
  callPackage = lib.callPackageWith (pkgs // finalPackages // { inherit sources; });

  sources = import ./npins {};

  madePackages = lib.packagesFromDirectoryRecursive {
    directory = ./pkgs;
    inherit callPackage;
  };

  generatedPackages = lib.mapAttrs (
    port: src:
    madePackages.buildEvergardenPort {
      inherit port src;
    }
  ) sources;

  finalPackages = generatedPackages // madePackages;
in
finalPackages
