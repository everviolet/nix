{ evgLib }:
{
  lib,
  config,
  ...
}:
let
  inherit (lib) mkIf;

  cfg = config.evergarden.fzf;

  palette = evgLib.palette.${cfg.variant} // {
    inherit (cfg) accent;
  };
in
{
  options.evergarden.fzf = evgLib.options.mkEvergardenOptions {
    port = "fzf";
    inherit config;
  };

  config = mkIf cfg.enable {
    programs.fzf.colors = {
      fg = "#${palette.text}"; # Text
      bg = "-1"; # Background
      "fg+" = "#${palette.text}"; # Text (current line)
      "bg+" = "#${palette.surface0}"; # Background (current line)
      preview-fg = "-1"; # Preview window text
      preview-bg = "-1"; # Preview window background
      hl = "#${palette.snow}"; # Highlighted substrings
      "hl+" = "#${palette.snow}"; # Highlighted substrings (current line)
      gutter = "-1"; # Gutter on the left (defaults to bg+)
      info = "#${palette.subtext0}"; # Info
      border = "-1"; # Border of the preview window and horizontal separators (--border)
      prompt = "#${palette.surface0}"; # Prompt
      pointer = "#${palette.overlay1}"; # Pointer to the current line
      marker = "#${palette.yellow}"; # Multi-select marker
      spinner = "#${palette.skye}"; # Streaming input indicator
      header = "#${palette.skye}"; # Header
    };
  };
}
