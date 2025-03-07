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
    })
    // {
      ports = lib.mkOption {
        type = lib.types.lazyAttrsOf lib.types.package;
        default = import ../default.nix { inherit pkgs; };
        description = "A map of sources for the evergarden theme";
      };
    };

  imports = importApplySelf evgModules;
}
