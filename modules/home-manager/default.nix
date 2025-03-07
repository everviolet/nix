{ evgLib }:
{ lib, ... }:
{
  imports = [
    (lib.modules.importApply ../global.nix {
      evgModules = import ./all-modules.nix;
      inherit evgLib;
    })
  ];
}
