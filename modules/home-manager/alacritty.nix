{ evgLib }:
{ lib, config, ... }:
let
  inherit (config.evergarden) ports;

  cfg = config.evergarden.alacritty;
in
{
  options.evergarden.alacritty = evgLib.options.mkEvergardenOptions {
    port = "alacritty";
    inherit config;
    accentSupport = true;
  };

  config = lib.mkIf cfg.enable {
    programs.alacritty = {
      settings.general.import = lib.mkBefore [
        "${ports.alacritty}/evergarden-${cfg.variant}-${cfg.accent}.toml"
      ];
    };
  };
}
