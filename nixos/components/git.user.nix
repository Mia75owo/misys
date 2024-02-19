{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;
    userName = "Mia";
    userEmail = "miabernhardt75@gmail.com";
    extraConfig = {
      credential.heler = "store";
    };
  };
}
