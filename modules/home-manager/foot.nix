{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (config.evergarden) ports;
  cfg = config.evergarden.foot;
in
{
  options.evergarden.foot = evgLib.options.mkEvergardenOptions {
    port = "foot";
    inherit config;
    accentSupport = true;
  };

  config = mkIf cfg.enable {
    programs.foot.settings.main.include = [ "${ports.foot}/evergarden-${cfg.variant}-${cfg.accent}.ini" ];
  };
}
