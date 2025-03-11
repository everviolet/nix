{ buildEvergardenPort }:
buildEvergardenPort {
  port = "lazygit";

  targets = [
    "themes"
    "themes-mergable"
  ];
}
