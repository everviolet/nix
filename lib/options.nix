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
        default = if enableDefault then config.evergarden.variant else "fall";
        description = "The variant to use";
      };
    }
    // (optionalAttrs accentSupport {
      accent = mkOption {
        type = types.enum evgLib.consts.accents;
        default = if enableDefault then config.evergarden.accent else "green";
        description = "The accent to use";
      };
    });
}
