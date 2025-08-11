{ palette }:
let
  inherit (builtins) removeAttrs mapAttrs;

  themes = removeAttrs palette [ "colors" ];

  mkTheme = theme: {
    base00 = theme.surface1;
    base01 = theme.red;
    base02 = theme.green;
    base03 = theme.yellow;
    base04 = theme.blue;
    base05 = theme.pink;
    base06 = theme.aqua;
    base07 = theme.subtext0;
    base08 = theme.overlay1;
    base09 = theme.red;
    base0A = theme.green;
    base0B = theme.yellow;
    base0C = theme.blue;
    base0D = theme.pink;
    base0E = theme.aqua;
    base0F = theme.subtext1;
  };
in
mapAttrs (_: mkTheme) themes
