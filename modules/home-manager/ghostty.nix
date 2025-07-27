{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  inherit (config.evergarden) ports;
  cfg = config.evergarden.ghostty;
  inherit (cfg) variant accent;
in
{
  options.evergarden.ghostty = evgLib.options.mkEvergardenOptions {
    port = "ghostty";
    inherit config;
    accentSupport = true;
  };

  config = mkIf cfg.enable {
    programs.ghostty.settings.theme = "${ports.ghostty}/evergarden-${variant}-${accent}.yml";
  };
}
