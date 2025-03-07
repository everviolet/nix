{ self }:
let
  whiskers-palette = builtins.toJSON {
    mocha = self.evergarden.toCatppuccinPalette self.evergarden.palette.winter;
    macchiato = self.evergarden.toCatppuccinPalette self.evergarden.palette.fall;
    frappe = self.evergarden.toCatppuccinPalette self.evergarden.palette.spring;
  };
  ctpcolormap =
    name:
    {
      red = "red";
      orange = "peach";
      yellow = "yellow";
      green = "green";
      aqua = "teal";
      skye = "sky";
      blue = "blue";
      purple = "lavender";
      pink = "pink";
    }
    .${name};
  mkWhiskersArgs =
    flavor: name:
    let
      value = ctpcolormap name;
    in
    ''
      --flavor ${flavor} \
      --color-overrides '${whiskers-palette}' \
      --overrides '{ "accent": { "ctp": "${value}", "name": "${name}" } }' \
    '';
in
{
  inherit whiskers-palette mkWhiskersArgs;
}
