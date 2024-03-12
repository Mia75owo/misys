{ config, lib, pkgs, ... }:

{
  programs.lazygit = {
    enable = true;

    settings = (lib.mkMerge [
      ({})
      (builtins.fromJSON (builtins.readFile ../resources/catppuccin-mocha-lazygit.json))
    ]);
  };
}
