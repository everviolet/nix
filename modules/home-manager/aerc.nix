{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (config.evergarden) ports;
  cfg = config.evergarden.aerc;
in
{
  options.evergarden.aerc = evgLib.options.mkEvergardenOptions {
    port = "aerc";
    inherit config;
    accentSupport = false;
  };

  config = mkIf cfg.enable {
    programs.aerc.extraConfig.ui = {
      border-char-vertical="│";
      border-char-horizontal="─";
      styleset-name = "evergarden-${cfg.variant}";
      stylesets-dirs = toString ports.aerc;
    };
  };
}
