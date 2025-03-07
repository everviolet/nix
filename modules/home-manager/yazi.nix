{ evgLib }:
{
  lib,
  pkgs,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.evergarden.yazi;

  inherit (evgLib) palette;
  sp = palette.${cfg.variant};

  mkFg = fg: { fg = "#${fg}"; };
  mkBg = bg: { bg = "#${bg}"; };
  mkBoth = fg: bg: (mkFg fg) // (mkBg bg);
  mkSame = c: mkBoth c c;

  active = mkBoth sp.text sp.surface0;

  mkRule = mime: fg: (mkFg fg) // { inherit mime; };
in
{
  options.evergarden.yazi = evgLib.options.mkEvergardenOptions {
    port = "yazi";
    inherit config;
  };

  config = mkIf cfg.enable {
    programs.yazi.theme = {
      manager = {
        syntect_theme = pkgs.writeTextFile {
          name = "evergarden-syntax";
          text = evgLib.textmate sp;
        };

        cwd = mkFg sp.aqua;
        hovered = active;
        preview_hovered = active;
        find_keyword = mkFg sp.green;
        find_position = mkFg sp.text;
        marker_selected = mkSame sp.green;
        marker_copied = mkSame sp.yellow;
        marker_cut = mkSame sp.red;
        tab_active = mkBoth sp.base sp.green;
        tab_inactive = mkBoth sp.surface2 sp.subtext1;
        border_style = mkFg sp.surface2;
      };

      mode = {
        normal_main = mkBoth sp.base sp.green;
        normal_alt = mkBoth sp.base sp.green;
        select_main = mkBoth sp.base sp.purple;
        select_alt = mkBoth sp.purple sp.base;
        unset_main = mkBoth sp.base sp.overlay1;
        unset_alt = mkBoth sp.overlay1 sp.base;
      };

      status = {
        separator_style = mkSame sp.surface0;
        progress_label = mkBoth sp.text sp.base;
        progress_normal = mkBoth sp.text sp.base;
        progress_error = mkBoth sp.red sp.base;
        permissions_t = mkFg sp.blue;
        permissions_r = mkFg sp.yellow;
        permissions_w = mkFg sp.purple;
        permissions_x = mkFg sp.green;
        permissions_s = mkFg sp.aqua;
      };

      select = {
        border = mkFg sp.green;
        active = mkFg sp.pink;
        inactive = mkFg sp.text;
      };

      input = {
        border = mkFg sp.green;
        title = mkFg sp.text;
        value = mkFg sp.text;
        selected = mkBg sp.surface0;
      };

      completion = {
        border = mkFg sp.green;
        active = mkBoth sp.pink sp.surface0;
        inactive = mkFg sp.text;
      };

      tasks = {
        border = mkFg sp.green;
        title = mkFg sp.text;
        hovered = mkBoth sp.text sp.surface0;
      };

      which = {
        mask = mkBg sp.surface2;
        cand = mkFg sp.aqua;
        rest = mkFg sp.overlay0;
        desc = mkFg sp.text;
        separator_style = mkFg sp.overlay1;
      };

      help = {
        on = mkFg sp.pink;
        run = mkFg sp.aqua;
        desc = mkFg sp.text;
        hovered = mkBoth sp.text sp.surface0;
        footer = mkFg sp.text;
      };

      # https://github.com/sxyazi/yazi/blob/main/yazi-config/preset/theme.toml
      filetype.rules = [
        (mkRule "image/*" sp.aqua)
        (mkRule "video/*" sp.yellow)
        (mkRule "audio/*" sp.yellow)

        (mkRule "application/zip" sp.pink)
        (mkRule "application/gzip" sp.pink)
        (mkRule "application/x-tar" sp.pink)
        (mkRule "application/x-bzip" sp.pink)
        (mkRule "application/x-bzip2" sp.pink)
        (mkRule "application/x-7z-compressed" sp.pink)
        (mkRule "application/x-rar" sp.pink)
        (mkRule "application/xz" sp.pink)

        (mkRule "application/doc" sp.green)
        (mkRule "application/pdf" sp.green)
        (mkRule "application/rtf" sp.green)
        (mkRule "application/vnd.*" sp.green)

        ((mkRule "inode/directory" sp.overlay2) // { bold = true; })
        (mkRule "*" sp.subtext1)
      ];
    };
  };
}
