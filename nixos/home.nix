{ config, pkgs, inputs, ... }:

let inherit (import ./impermanence/persist.nix) persist-home;

in {
  imports = [
    ./components/bar.user.nix
    ./components/dunst.user.nix
    ./components/fish.user.nix
    ./components/git.user.nix
    ./components/globals.user.nix
    ./components/nvim.user.nix
    ./components/rofi.user.nix
    ./components/shell.user.nix
    ./components/spicetify.user.nix
    ./components/terminal.user.nix
    ./components/wm.user.nix
    ./components/yazi.user.nix
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
      name = "Catppuccin-Macciato-Compact-Pink-Dark";
      package = pkgs.catppuccin-gtk.override {
        accents = [ "pink" ];
        size = "compact";
        tweaks = [ "rimless" "black" ];
        variant = "macchiato";
      };
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "neovide.dekstop" ];
    "video/*" = [ "vlc.desktop" ];
  };

  home.stateVersion = "24.05";

  programs.home-manager.enable = true;
}
