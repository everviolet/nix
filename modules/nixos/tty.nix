{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  inherit (evgLib) palette;
  colors = palette.${config.evergarden.variant};

  cfg = config.evergarden.tty;
in
{
  options.evergarden.tty = evgLib.options.mkEvergardenOptions {
    port = "tty";
    inherit config;
  };

  config = mkIf cfg.enable {
    console.colors = [
      colors.base
      colors.red
      colors.green
      colors.yellow
      colors.blue
      colors.pink
      colors.aqua
      colors.text
      colors.surface1
      colors.red
      colors.green
      colors.yellow
      colors.blue
      colors.pink
      colors.aqua
      colors.subtext1
    ];
  };
}
