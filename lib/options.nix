{ lib, evgLib }:
let
  inherit (lib)
    mkOption
    types
    optionalString
    optionalAttrs
    ;
in
{
  mkEvergardenOptions =
    {
      port ? null,
      enableDefault ? true,
      accentSupport ? false,
      config,
    }:
    {
      enable = mkOption {
        type = types.bool;
        default = if enableDefault then config.evergarden.enable else false;
        description = "Enable the evergarden${optionalString (port != null) " ${port}"} theme";
      };

      variant = mkOption {
        type = types.enum evgLib.consts.variants;
        default = "fall";
        description = "The variant to use";
      };
    }
    // (optionalAttrs accentSupport {
      accent = mkOption {
        type = types.enum evgLib.consts.accents;
        default = config.evergarden.accent;
        description = "The accent to use";
      };
    });
}
