{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:
lib.extendMkDerivation {
  constructDrv = stdenvNoCC.mkDerivation;

  extendDrvArgs = finalAttrs: args: {
    name = "evergarden-${args.port}-${args.version or (builtins.substring 0 7 finalAttrs.src.rev)}";

    src =
      args.src or (fetchFromGitHub {
        owner = "comfysage";
        repo = "evergarden";
        inherit (args) rev hash;
        sparseCheckout = [ "extras/${args.port}" ];
      });

    installPhase =
      args.installPhase or ''
        runHook preInstall

        mkdir -p $out
        cp -r extras/${args.port}/* $out

        runHook postInstall
      '';

    meta = (args.meta or { }) // {
      homepage = "https://github.com/comfysage/evergarden/tree/mega/extras/${finalAttrs.pname}";
      maintainers = with lib.maintainers; [
        isabelroses
        comfysage
      ];
      platform = lib.platforms.all;
    };
  };
}
