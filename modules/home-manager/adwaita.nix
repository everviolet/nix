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

  config = mkIf cfg.enable {
    gtk.gtk3 =
      let
        colorScheme = if cfg.variant == "summer" then "light" else "dark";
      in
      {
        theme = {
          name = "adw-gtk3-${colorScheme}";
          package = pkgs.adw-gtk3;
        };
        inherit colorScheme;
        extraCss = ''
          @import url("${ports.adwaita}/evergarden-${cfg.variant}-${cfg.accent}.css");
        '';
      };
  };
}
