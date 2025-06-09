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

      evgLib = import ./lib { inherit lib; };

      forAllSystems =
        function: lib.genAttrs lib.systems.flakeExposed (system: function nixpkgs.legacyPackages.${system});

      mkModule =
        {
          name ? "default",
          class,
          file,
        }:
        {
          _class = class;
          _file = "${self.outPath}/flake.nix#${class}Modules.${name}";

          imports = [ (import file { inherit evgLib; }) ];
        };
    in
    {
      lib = evgLib;

      legacyPackages = forAllSystems (pkgs: import ./default.nix { inherit pkgs; });
      packages = forAllSystems (pkgs: import ./default.nix { inherit pkgs; });

      homeManagerModules = {
        default = mkModule {
          class = "homeManager";
          file = ./modules/home-manager;
        };

        evergarden = self.homeManagerModules.default;
      };

      devShells = forAllSystems (pkgs: {
        default = pkgs.mkShellNoCC {
          packages = with pkgs; [
            just
            nvfetcher
          ];
        };
      });

      formatter = forAllSystems (pkgs: pkgs.nixfmt-rfc-style);
    };
}
