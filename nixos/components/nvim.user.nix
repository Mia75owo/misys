{ config, lib, pkgs, ... }:

{
  programs.neovim.enable = true;
  home.activation.link_nvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ln -sf $VERBOSE_ARG /persist/misys/nixos/nvim ${config.xdg.configHome}
  '';
}
