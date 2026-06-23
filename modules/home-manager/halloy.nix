{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (config.evergarden) ports;
  cfg = config.evergarden.halloy;
in
{
  options.evergarden.halloy = evgLib.options.mkEvergardenOptions {
    port = "halloy";
    inherit config;
    accentSupport = false;
  };

  config = mkIf cfg.enable {
    programs.halloy.settings.theme = "evergarden-${cfg.variant}";

    xdg.configFile = builtins.listToAttrs (
      map (variant: {
        name = "halloy/themes/evergarden-${variant}.toml";
        value.source = ports.halloy + "/evergarden-${variant}.toml";
      }) evgLib.consts.variants
    );
  };
}
