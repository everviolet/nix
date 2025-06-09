{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  inherit (config.evergarden) ports;
  cfg = config.evergarden.bat;
in
{
  options.evergarden.bat = evgLib.options.mkEvergardenOptions {
    port = "bat";
    inherit config;
  };

  config = mkIf cfg.enable {
    programs.bat = {
      config.theme = "evergarden";

      themes.evergarden = {
        src = ports.bat;
        file = "evergarden-${cfg.variant}.tmTheme";
      };
    };
  };
}
