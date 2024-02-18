{ config, pkgs, inputs, ... }:

{
  imports = [
    ./components/globals.user.nix
    ./components/terminal.user.nix
    ./components/shell.user.nix
    ./components/wm.user.nix
    ./components/bar.user.nix
    ./components/spicetify.user.nix
    ./components/rofi.user.nix
    ./components/dunst.user.nix
    ./components/fish.user.nix
    ./components/nvim.user.nix
    ./components/yazi.user.nix
    inputs.impermanence.nixosModules.home-manager.impermanence
    ./impermanence/persist.nix
  ];

  home.username = "mia";
  home.homeDirectory = "/home/mia";

  home.packages = [ pkgs.dconf ];

  home.sessionVariables = {
    # EDITOR = "nvim";
  };

  home.file = {};

  # home.file.".gdbinit".text = ''
  #   set auto-load safe-path /nix/store
  # '';

  programs.git = {
    enable = true;
    userName = "Mia";
    userEmail = "miabernhardt75@gmail.com";
  };

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
