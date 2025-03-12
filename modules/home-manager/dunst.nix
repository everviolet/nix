{ evgLib }:
{ lib, config, ... }:
let
  cfg = config.evergarden.dunst;
  palette = evgLib.palette.${cfg.variant} // {
    inherit (cfg) accent;
  };
in
{
  options.evergarden.dunst = evgLib.options.mkEvergardenOptions {
    port = "dunst";
    inherit config;
    accentSupport = true;
  };

  config = lib.mkIf cfg.enable {
    services.dunst.settings = {
      global = {
        background = "#${palette.base}";
        foreground = "#${palette.text}";
        frame_color = "#${palette.accent}";
      };

      urgency_low = {
        background = "#${palette.base}";
        foreground = "#${palette.overlay2}";
        frame_color = "#${palette.overlay2}";
      };

      urgency_normal = {
        background = "#${palette.base}";
        foreground = "#${palette.text}";
        frame_color = "#${palette.accent}";
      };

      urgency_critical = {
        background = "#${palette.base}";
        foreground = "#${palette.text}";
        frame_color = "#${palette.red}";
      };
    };
  };
}
