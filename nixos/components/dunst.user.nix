{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libnotify
  ];

  services.dunst = {
    enable = true;

    settings = (lib.mkMerge [
      # Normal settings
      ({
        global = {
          width = 300;
          height = 300;
          offset = "30x50";
          origin = "top-right";
          transparency = 10;
          font = "FiraCode Nerd Font Mono 12";
        };

        urgency_normal = {
          timeout = 10;
        };
      })

      # Theme Config
      (builtins.fromTOML (builtins.readFile ../resources/catppuccin-mocha-dunst.conf))
    ]);

  };
}
