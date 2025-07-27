{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.evergarden.tmux;
in
{
  options.evergarden.tmux = evgLib.options.mkEvergardenOptions {
    port = "tmux";
    inherit config;
  };

  config = mkIf cfg.enable {
    programs.tmux.plugins = [
      {
        plugin = config.evergarden.ports.tmux;
        extraConfig = ''
          set -gq @evergarden_style "${cfg.variant}"
        '';
      }
    ];
  };
}
