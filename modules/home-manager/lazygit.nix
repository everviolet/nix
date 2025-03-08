{
  evgLib,
}:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (config.evergarden) ports;
  cfg = config.evergarden.lazygit;

  enableXdgConfig = !pkgs.stdenv.hostPlatform.isDarwin || config.xdg.enable;

  configDirectory =
    if enableXdgConfig then
      config.xdg.configHome
    else
      "${config.home.homeDirectory}/Library/Application Support";
  configFile = "${configDirectory}/lazygit/config.yml";
in
{
  options.evergarden.lazygit = evgLib.options.mkEvergardenOptions {
    port = "lazygit";
    inherit config;
    accentSupport = true;
  };

  config = lib.mkIf cfg.enable {
    home.sessionVariables = {
      LG_CONFIG_FILE = "${ports.lazygit}/themes-mergable/evergarden-${cfg.variant}-${cfg.accent}.yml,${configFile}";
    };
  };
}
