{
  description = "evergarden theme";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    {
      self,
      nixpkgs,
    }:
    let
      inherit (nixpkgs) lib;

      forAllSystems =
        function: lib.genAttrs lib.systems.flakeExposed (system: function nixpkgs.legacyPackages.${system});
    in
    {
      lib = import ./lib { inherit lib; };

      devShells = forAllSystems (pkgs: {
        default = pkgs.callPackage ./shell.nix { evgLib = self.lib.evergarden; };
      });

      legacyPackages = forAllSystems (pkgs: import ./default.nix { inherit pkgs; });
      packages = forAllSystems (pkgs: import ./default.nix { inherit pkgs; });
    };
}
