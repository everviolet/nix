{
  lib,
  sources,
  stdenvNoCC,
  fetchFromGitHub,
}:
lib.extendMkDerivation {
  constructDrv = stdenvNoCC.mkDerivation;

  extendDrvArgs = finalAttrs: args: {
    pname = "evergarden-${finalAttrs.port}";
    version = args.version or ("0-" + (builtins.substring 0 7 finalAttrs.src.rev));

    src =
      args.src or sources.${finalAttrs.port} or (fetchFromGitHub {
        owner = "everviolet";
        repo = finalAttrs.port;
        inherit (args) rev hash;
      });

    installPhase = args.installPhase or (builtins.readFile ./install.sh);

    meta = {
      homepage = "https://github.com/everviolet/${finalAttrs.port}";
      maintainers = with lib.maintainers; [
        isabelroses
        comfysage
      ];
      platform = lib.platforms.all;
    } // (args.meta or { });
  };
}
