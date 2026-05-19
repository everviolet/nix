{ evgLib }:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  inherit (config.evergarden) ports;
  cfg = config.evergarden.adwaita;
in
{
  options.evergarden.adwaita = evgLib.options.mkEvergardenOptions {
    port = "adwaita";
    inherit config;
    accentSupport = true;
  };

  config =
    let
      colorScheme = if cfg.variant == "summer" then "light" else "dark";
      theme = "adw-gtk3-${colorScheme}";
    in
    mkIf cfg.enable {
      gtk = {
        theme = {
          name = theme;
          package = pkgs.adw-gtk3;
        };
        inherit colorScheme;

        gtk3.extraCss = ''
          @import url("${ports.adwaita}/evergarden-${cfg.variant}-${cfg.accent}.css");
        '';

        gtk4.extraCss = ''
          @import url("${ports.adwaita}/evergarden-${cfg.variant}-${cfg.accent}.css");
          @import url("${ports.adwaita}/gtk4.css");
        '';
      };

      dconf.settings = {
        "org/gnome/desktop/interface" = {
          color-scheme = "prefer-${colorScheme}";
          gtk-theme = theme;
        };
      };
    };
}
