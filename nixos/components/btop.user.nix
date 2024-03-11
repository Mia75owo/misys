{ config, ... }:

{
  programs.btop = { 
    enable = true;

    settings = {
      color_theme = "catppuccin-mocha";
      theme_background = false;
      vim_keys = true;
      update_ms = 1000;
    };
  };

  home.file."${config.xdg.configHome}/btop/themes/catppuccin-mocha.theme" = {
    source = ../resources/catppuccin-mocha-btop.theme;
  };
}
