{
  persist-home = {
    directories = [
      "code"
      "Downloads"
      ".ssh"
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/nvim"
      ".local/share/zsh"
      ".config/spotify"
    ];
    allowOther = true;
  };
  persist-system = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/bluetooth"
      "/var/lib/systemd/coredump"
      "/var/NetworkManager/system-connections"
      "/etc/ssh"
    ];
    files = [
      "/etc/machine-id"
      { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
  };
}
