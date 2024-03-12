{ config, lib, pkgs, ... }:

{
  programs.lazygit = {
    enable = true;

    settings = (lib.mkMerge [
      ({})
      (builtins.fromJSON (builtins.readFile ../resources/catppuccin-mocha-lazygit.json))
    ]);
  };

  home.file."${config.xdg.configHome}/lazygit/themes/catppuccin-mocha.yml" = {
    source = ../resources/catppuccin-mocha-lazygit.yml;
  };
}
