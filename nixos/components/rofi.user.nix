{ config, lib, pkgs, ... }:

{
  programs.rofi = {
    enable = true;
    theme = "catppuccin-mocha";

    extraConfig = {
      modi = "drun";
      font = "FiraCode Nerd Font Mono";
      show-icons = true;
    };
  };

  home.file."${config.xdg.configHome}/rofi/catppuccin-mocha.rasi" = {
    source = ../resources/catppuccin-mocha-rofi.rasi;
  };
}
