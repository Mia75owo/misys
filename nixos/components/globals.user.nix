{ lib, ... }:

{
  options = with  lib; with types; {
    icons = mkOption { type = attrs; };
    colors = mkOption { type = attrs; };
  };

  config = {
    icons = {
      nixos = "";
      cpu = "󰍛";
      memory = "";
      date = "";
      volume-muted = "󰖁";
      volume-0 = "󰕿";
      volume-1 = "󰖀";
      volume-2 = "󰕾";
      battery-0 = "󱊡";
      battery-1 = "󱊢";
      battery-2 = "󱊣";
      battery-charging = "󰂅";
      microphone = "";
      microphone-muted = "";
      microphone-disconnected = "";
      wifi = "";
      up = "";
      down = "";
      ethernet = "";
      envelope = "";

      terminal = "";
      chrome = "";
      steam = "";
      discord = "󰙯";
      spotify = "";
    };
    colors = {
      rosewater = "#f4dbd6";
      flamingo = "#f0c6c6";
      pink = "#f5bde6";
      mauve = "#c6a0f6";
      red = "#ed8796";
      maroon = "#ee99a0";
      peach = "#f5a97f";
      yellow = "#eed49f";
      green = "#a6da95";
      teal = "#8bd5ca";
      sky = "#91d7e3";
      sapphire = "#7dc4e4";
      blue = "#8aadf4";
      lavender = "#b7bdf8";
      text = "#cad3f5";
      subtext1 = "#b8c0e0";
      subtext0 = "#a5adcb";
      overlay2 = "#939ab7";
      overlay1 = "#8087a2";
      overlay0 = "#6e738d";
      surface2 = "#5b6078";
      surface1 = "#494d64";
      surface0 = "#363a4f";
      base = "#24273a";
      mantle = "#1e2030";
      crust = "#181926";
    };
  };
}
