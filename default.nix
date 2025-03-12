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

  sources = lib.pipe { } [
    (pkgs.callPackage ./_sources/generated.nix)
    (lib.flip lib.removeAttrs [
      "override"
      "overrideAttrs"
    ])
    (lib.mapAttrs (_: v: v.src))
  ];

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
