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
  callPackage = lib.callPackageWith (pkgs // allPackages // { sources = sources'; });

  sources = lib.importJSON ./pkgs/ports.json;

  sources' = lib.mapAttrs (
    port: attrs:
    pkgs.fetchFromGitHub {
      owner = "everviolet";
      repo = port;
      inherit (attrs) rev hash;
    }
  ) sources;

  packages = lib.packagesFromDirectoryRecursive {
    directory = ./pkgs;
    inherit callPackage;
  };

  portsWithPackage = builtins.attrNames packages;
  portsWithoutPackage = builtins.removeAttrs sources portsWithPackage;

  packages' = lib.mapAttrs (
    port: attrs:
    packages.buildEvergardenPort {
      inherit port;
      inherit (attrs) rev hash;
    }
  ) portsWithoutPackage;

  allPackages = packages // packages';
in
allPackages
