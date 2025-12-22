{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  cfg = config.evergarden.helix;
  inherit (evgLib) palette;
  colors = palette.${cfg.variant};
  accent = colors.${cfg.accent};
in
{
  options.evergarden.helix = evgLib.options.mkEvergardenOptions {
    port = "helix";
    inherit config;
    accentSupport = true;
  };

  config = lib.mkIf cfg.enable {
    # Based off of template from https://github.com/everviolet/helix
    programs.helix.themes."evergarden_${cfg.variant}_${cfg.accent}" = {
      # Syntax Highlighting
      "attribute" = colors.cherry;
      "type" = {
        fg = colors.yellow;
        modifiers = [ "italic" ];
      };
      "constructor" = colors.green;
      "constant" = colors.pink;
      "string" = colors.lime;
      "string.regexp" = colors.yellow;
      "string.special" = colors.aqua;
      "string.path" = colors.blue;
      "string.url" = colors.blue;
      "comment" = {
        fg = colors.overlay2;
        modifiers = [ "italic" ];
      };
      "variable" = colors.text;
      "variable.builtin" = colors.pink;
      "variable.other.member" = colors.skye;
      "label" = {
        fg = colors.red;
        modifiers = [ "italic" ];
      };
      "punctuation" = colors.overlay1;
      "punctuation.special" = colors.aqua;
      "keyword" = {
        fg = colors.red;
        modifiers = [ "italic" ];
      };
      "keyword.operator" = colors.orange;
      "keyword.directive" = colors.cherry;
      "operator" = colors.subtext0;
      "function" = colors.green;
      "function.builtin" = colors.pink;
      "function.macro" = colors.aqua;
      "tag" = colors.skye;
      "namespace" = colors.snow;
      "special" = colors.lime;
      "markup" = colors.text;
      "markup.heading" = colors.red;
      "markup.heading.1" = colors.red;
      "markup.heading.2" = colors.orange;
      "markup.heading.3" = colors.yellow;
      "markup.heading.4" = colors.green;
      "markup.heading.5" = colors.aqua;
      "markup.heading.6" = colors.blue;
      "markup.list" = colors.overlay1;
      "markup.list.checked" = colors.green;
      "markup.list.unchecked" = colors.overlay1;
      "markup.bold" = {
        fg = colors.aqua;
        modifiers = [ "bold" ];
      };
      "markup.italic" = {
        fg = colors.aqua;
        modifiers = [ "italic" ];
      };
      "markup.link" = colors.blue;
      "markup.link.label" = {
        fg = colors.blue;
        modifiers = [ "italic" ];
      };
      "markup.quote" = {
        fg = colors.overlay2;
        modifiers = [ "italic" ];
      };
      "markup.raw" = colors.overlay1;
      "diff.plus" = colors.green;
      "diff.minus" = colors.red;
      "diff.delta" = colors.aqua;

      "ui.background" = {
        fg = colors.text;
        bg = colors.base;
      };
      "ui.background.separator" = {
        bg = colors.surface0;
      };
      "ui.cursor" = {
        fg = colors.base;
        bg = colors.accent;
        modifiers = [ "slow_blink" ];
      };
      "ui.linenr" = colors.surface2;
      "ui.statusline" = {
        fg = colors.overlay2;
        bg = colors.mantle;
      };
      "ui.statusline.normal" = {
        fg = colors.base;
        bg = colors.aqua;
        modifiers = [ "bold" ];
      };
      "ui.statusline.insert" = {
        fg = colors.base;
        bg = colors.text;
        modifiers = [ "bold" ];
      };
      "ui.statusline.select" = {
        fg = colors.base;
        bg = colors.pink;
        modifiers = [ "bold" ];
      };
      "ui.bufferline" = {
        fg = colors.subtext0;
        bg = colors.mantle;
      };
      "ui.bufferline.active" = {
        fg = colors.text;
        bg = colors.base;
        underline = {
          color = colors.text;
          style = "line";
        };
      };
      "ui.bufferline.background" = {
        bg = colors.crust;
      };
      "ui.help" = {
        fg = colors.overlay2;
        bg = colors.surface0;
      };
      "ui.popup" = {
        fg = colors.text;
        bg = colors.mantle;
      };
      "ui.popup.header" = {
        fg = colors.subtext0;
      };
      "ui.window" = colors.surface0;
      "ui.text" = colors.text;
      "ui.text.focus" = {
        fg = colors.text;
        bg = colors.surface0;
        modifiers = [ "bold" ];
      };
      "ui.text.inactive" = colors.overlay1;
      "ui.text.directory" = colors.blue;
      "ui.virtual" = colors.overlay0;
      "ui.virtual.ruler" = {
        bg = colors.surface0;
      };
      "ui.virtual.indent-guide" = colors.surface0;
      "ui.virtual.inlay-hint" = {
        fg = colors.surface1;
        bg = colors.mantle;
      };
      "ui.virtual.jump-label" = {
        fg = colors.accent;
        modifiers = [ "bold" ];
      };
      "ui.menu" = {
        fg = colors.text;
        bg = colors.mantle;
      };
      "ui.menu.scroll" = colors.accent;
      "ui.selection" = {
        fg = colors.text;
        bg = colors.surface1;
      };
      "ui.highlight" = {
        bg = colors.surface1;
        modifiers = [ "bold" ];
      };
      "ui.cursorline" = {
        bg = colors.surface0;
      };
      "ui.cursorcolumn" = {
        bg = colors.surface0;
      };
      "warning" = colors.yellow;
      "error" = colors.red;
      "info" = colors.aqua;
      "hint" = colors.skye;
      "diagnostic.hint" = colors.skye;
      "diagnostic.info" = colors.aqua;
      "diagnostic.warning" = colors.yellow;
      "diagnostic.error" = colors.red;
      "diagnostic.unnecessary" = {
        fg = colors.overlay0;
        modifiers = [ "italic" ];
      };
      "diagnostic.deprecated" = {
        fg = colors.overlay0;
        modifiers = [ "crossed_out" ];
      };
    };
  };
}
