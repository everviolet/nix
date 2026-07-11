{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  cfg = config.evergarden.helix;
  inherit (config.evergarden) ports;
  inherit (lib) mkIf;
  name = "evergarden_${cfg.variant}_${cfg.accent}";
in
{
  options.evergarden.helix = evgLib.options.mkEvergardenOptions {
    port = "helix";
    inherit config;
    accentSupport = true;
  };

  config = mkIf cfg.enable {
    programs.helix.settings.theme = name;

    xdg.configFile = {
      "helix/themes/${name}.toml".source = "${ports.helix}/${name}.toml";
    };
  };
}
