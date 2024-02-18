{ config, lib, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    libnotify
  ];

  services.dunst = {
    enable = true;

    settings = {
      global = {
        width = 300;
        height = 300;
        offset = "30x50";
        origin = "top-right";
        transparency = 10;
        frame_color = config.colors.pink;
        font = "FiraCode Nerd Font Mono 12";
      };

      urgency_normal = {
        background = config.colors.base;
        foreground = config.colors.pink;
        timeout = 10;
      };
    };
  };
}
