{ config, lib, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
  };
  home.file."${config.xdg.configHome}/yazi/theme.toml" = {
    source = ../resources/catppuccin-mocha-yazi.toml;
  };
}
