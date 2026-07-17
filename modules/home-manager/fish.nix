{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;
  inherit (config.evergarden) ports;
  cfg = config.evergarden.fish;
  name = "evergarden-${cfg.variant}";
in
{
  options.evergarden.fish = evgLib.options.mkEvergardenOptions {
    port = "fish";
    inherit config;
  };

  config = mkIf cfg.enable {
    xdg.configFile."fish/themes/${name}.theme".source = "${ports.fish}/${name}.theme";
    programs.fish.shellInit = ''
      fish_config theme choose ${name}
    '';
  };
}
