# Mia's NixOS System :)
{ inputs, config, pkgs, lib, ... }:

let
  inherit (import ./impermanence/persist.nix) persist-system;
  inherit (import ./impermanence/format.nix) format-command;
in
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
      inputs.impermanence.nixosModules.impermanence
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Setup Filesystems (with impermanence)
  fileSystems."/persist".neededForBoot = true;
  environment.persistence."/persist/system" = persist-system;
  # Impermanence format
  boot.initrd.postDeviceCommands = format-command;

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.theme = pkgs.stdenv.mkDerivation {
    pname = "catppuccin-mocha-grub";
    version = "1.0";
    src = ./resources/catppuccin-mocha-grub;
    installPhase = "cp -r . $out";
  };

  # Home Manager
  programs.fuse.userAllowOther = true;
  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users = {
      mia = import ./home.nix;
    };
  };


  # Default Shell
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  # Default User
  users.users.mia = {
    isNormalUser = true;
    description = "Mia";
    initialPassword = "862457913";

    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

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
    resolutions = [{ x = 1920; y = 1080; }];
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
    fzf
    gdb

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

  security = {
    rtkit.enable = true;
    sudo.wheelNeedsPassword = false;
  };

  sound.enable = true;
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

  system.stateVersion = "23.11";
}
