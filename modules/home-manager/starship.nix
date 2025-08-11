{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.evergarden.starship;

  sp = evgLib.util.mkPalette cfg;
in
{
  options.evergarden.starship = evgLib.options.mkEvergardenOptions {
    port = "starship";
    inherit config;
  };

  config = mkIf cfg.enable {
    programs.starship.settings = {
      palette = "evergarden_${cfg.variant}";
      "palettes.evergarden_${cfg.variant}" = sp;
    };
  };
}
