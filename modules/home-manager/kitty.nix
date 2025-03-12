{ evgLib }:
{ lib, config, ... }:
let
  inherit (config.evergarden) ports;

  cfg = config.evergarden.kitty;
in
{
  options.evergarden.kitty = evgLib.options.mkEvergardenOptions {
    port = "kitty";
    inherit config;
    accentSupport = true;
  };

  config = lib.mkIf cfg.enable {
    programs.kitty.extraConfig = lib.mkAfter ''
      include ${ports.kitty}/evergarden-${cfg.variant}-${cfg.accent}.conf
    '';
  };
}
