{ config, pkgs, inputs, ... }:

let inherit (import ./impermanence/persist.nix) persist-home;

in {
  imports = [
    ./components/btop.user.nix
    ./components/chromium.user.nix
    ./components/dunst.user.nix
    ./components/fish.user.nix
    ./components/git.user.nix
    ./components/globals.user.nix
    ./components/i3.user.nix
    ./components/kitty.user.nix
    ./components/lazygit.user.nix
    ./components/nvim.user.nix
    ./components/polybar.user.nix
    ./components/rofi.user.nix
    ./components/spicetify.user.nix
    ./components/yazi.user.nix
    ./components/zsh.user.nix
    inputs.impermanence.nixosModules.home-manager.impermanence
  ];

  home.username = "mia";
  home.homeDirectory = "/home/mia";

  # Persistence
  home.persistence."/persist/home" = persist-home;

  home.packages = [ pkgs.dconf ];
  home.sessionVariables = { };
  home.file = { };

  gtk = {
    enable = true;
    theme = {
      name = "Catppuccin-Mocha-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "mocha";
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.desktop" ];
    "video/*" = [ "vlc.desktop" ];
  };

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
