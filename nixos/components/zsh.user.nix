{ config, lib, pkgs, ... }:

{
  programs.bat.enable = true;
  programs.eza.enable = true;

  nixpkgs.overlays = [
    (final: prev: {
      zsh = prev.zsh.overrideAttrs (o: {
        patches = (o.patches or [ ]) ++ [
          ../resources/zsh-prompt-patch.patch
        ];
      });
    })
  ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;

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
        local tmp="$(mktemp -t "yazi-cwd.XXXXX")"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
          cd -- "$cwd"
        fi
        rm -f -- "$tmp"
      '';
      rb = ''
        sudo nixos-rebuild switch --flake path:/persist/misys#nixos
      '';
    };

    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      expireDuplicatesFirst = true;
      extended = true;
      save = 50000;
    };

    initExtra = ''
      unset KITTY_SHELL_INTEGRATION
      ITERM_SHELL_INTEGRATION_INSTALLED=Yes
      [[ ! -f ${../resources/.p10k.zsh} ]] || source ${../resources/.p10k.zsh}
      [[ ! -f ${../resources/catppuccin-mocha-zsh.zsh} ]] || source ${../resources/catppuccin-mocha-zsh.zsh}
    '';

    zplug = {
      enable = true;
      plugins = [
        { name = "zsh-users/zsh-autosuggestions"; }
        { name = "zsh-users/zsh-syntax-highlighting"; }
        { name = "jeffreytse/zsh-vi-mode"; }
        { name = "MichaelAquilina/zsh-you-should-use"; }
        { name = "chisui/zsh-nix-shell"; }
        { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
      ];
    };
  };
}
