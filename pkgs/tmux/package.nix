{ sources, tmuxPlugins }:
tmuxPlugins.mkTmuxPlugin rec {
  pluginName = "evergarden";
  version = src.rev;
  src = sources.tmux;
  rtpFilePath = "themes/evergarden.sh";
}
