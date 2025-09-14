{ evgLib }:
{ lib, config, ... }:
let
  inherit (config.evergarden) ports;

  cfg = config.evergarden.zathura;
in
{
  options.evergarden.zathura = evgLib.options.mkEvergardenOptions {
    port = "zathura";
    inherit config;
  };

  config = lib.mkIf cfg.enable {
    programs.zathura.extraConfig = lib.mkAfter ''
      include ${ports.zathura}/evergarden-${cfg.variant}.cfg
    '';
  };
}
