{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  inherit (config.evergarden) ports;
  cfg = config.evergarden.spicetify;
in
{
  options.evergarden.spicetify = evgLib.options.mkEvergardenOptions {
    port = "spicetify";
    inherit config;
  };

  config = mkIf cfg.enable {
    programs.spicetify = {
      colorScheme = cfg.variant;
      theme = {
        name = "evergarden";
        src = ports.spicetify;
      };
    };
  };
}
