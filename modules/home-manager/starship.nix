{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.evergarden.starship;

  inherit (evgLib) palette;
  sp = palette.${cfg.variant};
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
