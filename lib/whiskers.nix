{ self }:
let
  whiskers-palette = builtins.toJSON {
    mocha = self.evergarden.toCatppuccinPalette self.evergarden.palette.winter;
    macchiato = self.evergarden.toCatppuccinPalette self.evergarden.palette.fall;
    frappe = self.evergarden.toCatppuccinPalette self.evergarden.palette.spring;
  };
  mkWhiskersArgs = flavor: name: value: ''
    --flavor ${flavor} \
    --color-overrides '${whiskers-palette}' \
    --overrides '{ "accent": { "hex": "${value}", "name": "${name}" } }' \
  '';
in
{
  inherit whiskers-palette mkWhiskersArgs;
}
