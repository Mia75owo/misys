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
  };
}
