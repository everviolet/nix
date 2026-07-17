{ sources, tmuxPlugins }:
let
  src = sources.tmux;
in
tmuxPlugins.mkTmuxPlugin {
  pluginName = "evergarden";
  version = src.revision;
  inherit src;
  rtpFilePath = "themes/evergarden.sh";
}
