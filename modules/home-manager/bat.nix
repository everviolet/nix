{ evgLib }:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.evergarden.bat;

  inherit (evgLib) palette;
  sp = palette.${cfg.variant};
in
{
  options.evergarden.bat = evgLib.options.mkEvergardenOptions {
    port = "bat";
    inherit config;
  };

  config = mkIf cfg.enable {
    programs.bat = {
      config.theme = "evergarden";

      themes.evergarden.src = pkgs.writeTextFile {
        name = "evergarden-syntax";
        text = evgLib.textmate sp;
      };
    };
  };
}
