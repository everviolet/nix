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
  };

  config = mkIf cfg.enable {
    programs.ghostty.theme = "${ports.ghostty}/evergarden-${variant}-${accent}.yml";
  };
}
