{ evgLib, evgModules }:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) flip;
  inherit (lib.modules) importApply;

  importApplySelf = map (flip importApply { inherit evgLib; });
in
{
  options.evergarden =
    (evgLib.options.mkEvergardenOptions {
      enableDefault = false;
      inherit config;
      accentSupport = true;
    })
    // {
      ports = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.package;
        default = import ../default.nix { inherit pkgs; };
        description = "A map of sources for the evergarden theme";
      };

      cache.enable = lib.mkEnableOption "caching of the evergarden theme";
    };

  imports = importApplySelf evgModules;

  config = lib.mkIf config.evergarden.cache.enable {
    nix.settings = {
      substituters = [
        "https://everviolet.cachix.org"
      ];

      trusted-public-keys = [
        "everviolet.cachix.org-1:3nHvJgzKRRRCQZURheH1INddNlyU4OWqfn068t8AuvU="
      ];
    };
  };
}
