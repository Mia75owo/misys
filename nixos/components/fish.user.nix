{ config, lib, pkgs, ... }:

{
  programs.bat.enable = true;
  programs.eza.enable = true;

  programs.fish = {
    enable = true;

    shellAliases = {
      c = "clear";
      n = "nvim .";
      ls = "exa --icons";
      cat = "bat";
      ":x" = "exit";
      ns = "nix-shell";
      ccjson = ''
        mkdir build &&
        cd build &&
        cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON .. &&
        cp ./compile_commands.json ../ &&
        cd .. &&
        rm -rf build
      '';
      ya = ''
        set tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
          cd -- "$cwd"
        end
        rm -f -- "$tmp"
      '';
      rb = ''
        sudo nixos-rebuild switch --flake path:/persist/misys#nixos
      '';
    };

    plugins = [
      { name = "tide"; src = pkgs.fishPlugins.tide.src; }
    ];

    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      tide configure \
        --auto \
        --style=Classic \
        --prompt_colors='True color' \
        --classic_prompt_color=Light \
        --show_time='24-hour format' \
        --classic_prompt_separators=Angled \
        --powerline_prompt_heads=Slanted \
        --powerline_prompt_tails=Sharp \
        --powerline_prompt_style='Two lines, frame' \
        --prompt_connection=Disconnected \
        --powerline_right_prompt_frame=No \
        --prompt_connection_andor_frame_color=Light \
        --prompt_spacing=Sparse \
        --icons='Many icons' \
        --transient=No
    '';
  };
}
