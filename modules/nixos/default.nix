{ evgLib }:
{ lib, ... }:
{
  imports = [
    (lib.modules.importApply ../global.nix {
      evgModules = import ./module-list.nix;
      inherit evgLib;
    })
  ];
}
