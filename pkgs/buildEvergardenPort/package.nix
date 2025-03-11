{
  lib,
  sources,
  stdenvNoCC,
  fetchFromGitHub,
}:
lib.extendMkDerivation {
  constructDrv = stdenvNoCC.mkDerivation;

  extendDrvArgs = finalAttrs: args: {
    pname = "evergarden-${args.port}";
    version = args.version or ("0-" + (builtins.substring 0 7 finalAttrs.src.rev));

    src =
      args.src or sources.${args.port} or (fetchFromGitHub {
        owner = "everviolet";
        repo = finalAttrs.port;
        inherit (args) rev hash;
      });

    installPhase = args.installPhase or (builtins.readFile ./install.sh);

    meta = (args.meta or { }) // {
      homepage = "https://github.com/everviolet/${finalAttrs.port}";
      maintainers = with lib.maintainers; [
        isabelroses
        comfysage
      ];
      platform = lib.platforms.all;
    };
  };
}
