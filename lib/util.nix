{ lib, palette }:
{
  mkPalette =
    {
      variant,
      accent ? null,
      ...
    }:
    let
      pl = palette.${variant};
    in
    pl
    // lib.optionalAttrs (accent != null && pl ? ${accent}) {
      accent = pl.${accent};
    };
}
