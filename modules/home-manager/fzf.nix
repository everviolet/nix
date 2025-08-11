{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.evergarden.fzf;

  palette = evgLib.util.mkPalette cfg;
in
{
  options.evergarden.fzf = evgLib.options.mkEvergardenOptions {
    port = "fzf";
    inherit config;
    accentSupport = true;
  };

  config = mkIf cfg.enable {
    programs.fzf.colors = {
      fg = "#${palette.text}"; # Text
      bg = "-1"; # Background
      "fg+" = "#${palette.accent}"; # Text (current line)
      "bg+" = "#${palette.surface1}"; # Background (current line)
      preview-fg = "-1"; # Preview window text
      preview-bg = "-1"; # Preview window background
      hl = "#${palette.orange}"; # Highlighted substrings
      "hl+" = "#${palette.orange}"; # Highlighted substrings (current line)
      gutter = "-1"; # Gutter on the left (defaults to bg+)
      info = "#${palette.overlay1}"; # Info
      border = "#${palette.mantle}"; # Border of the preview window and horizontal separators (--border)
      prompt = "#${palette.pink}"; # Prompt
      pointer = "#${palette.accent}"; # Pointer to the current line
      marker = "#${palette.yellow}"; # Multi-select marker
      spinner = "#${palette.skye}"; # Streaming input indicator
      header = "#${palette.subtext0}"; # Header
    };
  };
}
