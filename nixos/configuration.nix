# Mia's NixOS System :)
{ inputs, config, pkgs, lib, ... }:

let inherit (import ./impermanence/persist.nix) persist-system;

in {
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      inputs.impermanence.nixosModules.impermanence
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      mia = import ./home.nix;
    };
  };


  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  users.users.mia = {
    isNormalUser = true;
    description = "Mia";
    initialPassword = "862457913";

    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [];
  };

  fileSystems."/persist".neededForBoot = true;
  environment.persistence."/persist/system" = persist-system;

  # Bootloader.
  boot.loader.grub.enable = true;
  #boot.loader.grub.device = "/dev/sda";
  #boot.loader.grub.useOSProber = true;
  # Impermanence format
  boot.initrd.postDeviceCommands = ''
    mkdir /btrfs_tmp
    mount /dev/root_vg/root /btrfs_tmp
    if [[ -e /btrfs_tmp/root ]]; then
        mkdir -p /btrfs_tmp/old_roots
        timestamp=$(date --date="@$(stat -c %Y /btrfs_tmp/root)" "+%Y-%m-%-d_%H:%M:%S")
        mv /btrfs_tmp/root "/btrfs_tmp/old_roots/$timestamp"
    fi

    delete_subvolume_recursively() {
        IFS=$'\n'
        for i in $(btrfs subvolume list -o "$1" | cut -f 9- -d ' '); do
            delete_subvolume_recursively "/btrfs_tmp/$i"
        done
        btrfs subvolume delete "$1"
    }

    for i in $(find /btrfs_tmp/old_roots/ -maxdepth 1 -mtime +3); do
        delete_subvolume_recursively "$i"
    done

    btrfs subvolume create /btrfs_tmp/root
    umount /btrfs_tmp
  '';

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  networking.networkmanager.enable = true;
  time.timeZone = "Europe/Berlin";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "de_DE.UTF-8";
    LC_IDENTIFICATION = "de_DE.UTF-8";
    LC_MEASUREMENT = "de_DE.UTF-8";
    LC_MONETARY = "de_DE.UTF-8";
    LC_NAME = "de_DE.UTF-8";
    LC_NUMERIC = "de_DE.UTF-8";
    LC_PAPER = "de_DE.UTF-8";
    LC_TELEPHONE = "de_DE.UTF-8";
    LC_TIME = "de_DE.UTF-8";
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "FiraCode" ]; })
  ];

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
    xkbOptions = "caps:escape";
  };

  # Configure console keymap
  console.keyMap = "de";

  # Enable automatic login for the user.
  services.getty.autologinUser = "mia";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    home-manager

    kitty
    neovim

    nixpkgs-fmt

    file
    tree
    neofetch
    bat
    eza # exa
    wget
    ripgrep
    zip
    unzip

    lazygit
    btop
    zfxtop
    xclip
    yazi
    zoxide

    clang
    cargo
    gnumake
    cmake

    glava
    glxinfo
    vlc
    chromium
    neovide
    font-manager
    arandr
    #nemo

    # language servers
    rust-analyzer
    clang-tools
    lua-language-server
    nixd
  ];

  programs.neovim.enable = true;
  programs.neovim.defaultEditor = true;

  services.xserver = {
    enable = true;

    desktopManager = {
      xterm.enable = false;
    };

    displayManager = {
      defaultSession = "none+i3";
    };

    windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
    };
  };

  # xdg.portal.enable = true;


  sound.enable = true;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
    jack.enable = true;
  };
  services.picom.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      X11Forwarding = true;
    };
  };

  services.qemuGuest.enable = true;

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?
}
