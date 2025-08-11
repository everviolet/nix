{ lib }:
lib.fixedPoints.makeExtensible (self: {
  base16 = import ./base16.nix { inherit (self) palette; };
  consts = import ./consts.nix;
  options = import ./options.nix {
    inherit lib;
    evgLib = self;
  };
  palette = import ./palette.nix;
  textmate = import ./textmate.nix;
  util = import ./util.nix {
    inherit lib;
    inherit (self) palette;
  };
})
