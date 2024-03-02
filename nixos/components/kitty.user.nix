{ lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    theme = "Catppuccin-Macchiato";

    font = {
      package = pkgs.fira-code;
      name = "FiraCode Nerd Font";
      size = 15;
    };

    settings = {
      # Font
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";

      # Cursor
      disable_ligatures = "cursor";
      cursor_shape = "beam";

      # Sound
      enable_audio_bell = "no";

      # Visuals
      background_opacity = "0.7";

      # No confirm for close
      confirm_os_window_close = "0";
    };

    keybindings = {
      "ctrl+shift" = "kitty_mod";
    };
  };

  programs.zsh.shellAliases.icat = "kitty +kitten icat";
  programs.zsh.shellAliases.ssh = "kitty +kitten ssh";
}
