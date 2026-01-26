{ evgLib }:
{
  lib,
  config,
  options,
  ...
}:
let
  inherit (lib) optionalAttrs;

  inherit (config.evergarden) ports;
  cfg = config.evergarden.spicetify;
in
{
  options.evergarden.spicetify = evgLib.options.mkEvergardenOptions {
    port = "spicetify";
    inherit config;
    enableDefault = options.programs ? "spicetify";
  };

  config.programs = optionalAttrs cfg.enable {
    spicetify = {
      colorScheme = cfg.variant;
      theme = {
        name = "evergarden";
        src = ports.spicetify;
      };
    };
  };
}
