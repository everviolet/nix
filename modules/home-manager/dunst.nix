{ evgLib }:
{ lib, config, ... }:
let
  cfg = config.evergarden.dunst;
  inherit (config.evergarden) ports;
  name = "evergarden-${cfg.variant}-${cfg.accent}.conf";
in
{
  options.evergarden.dunst =
    evgLib.options.mkEvergardenOptions {
      port = "dunst";
      inherit config;
      accentSupport = true;
    }
    // {
      # from https://github.com/catppuccin/nix/blob/96799f24cf1366fe88e1293c3d27521a8f2129cf/modules/home-manager/dunst.nix
      prefix = lib.mkOption {
        type = lib.types.str;
        default = "00";
        description = "Prefix to use for the dunst drop-in file";
      };
    };

  config = lib.mkIf cfg.enable {
    xdg.configFile = {
      "dunst/dunstrc.d/${cfg.prefix}-${name}".source = "${ports.dunst}/${name}";
    };
  };
}
