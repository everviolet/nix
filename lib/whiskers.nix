{ self }:

let

  whiskers-palette = builtins.toJSON {
    all = self.evergarden.toCatppuccinPalette self.evergarden.palette;
  };

  mkWhiskersArgs = name: value: ''
    --flavor mocha \
    --color-overrides '${whiskers-palette}' \
    --overrides '{ "accent": { "hex": "${value}", "name": "${name}" } }' \
  '';
in

{
  inherit whiskers-palette mkWhiskersArgs;
}
