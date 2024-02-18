{ pkgs, inputs, ... }:

{
  home.persistence."/persist/home" = {
    directories = [
      "Downloads"
      ".ssh"
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/nvim"
      ".local/share/zsh"
    ];
    allowOther = true;
  };
}
