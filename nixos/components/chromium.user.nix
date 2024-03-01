{ config, lib, pkgs, inputs, ... }:

let cfg = config.modules.desktop.browsers.chromium;
in {
  programs.chromium = {
    enable = true;
    extensions = [
      {
        # Dark Reader
        id = "eimadpbcbfnmbkopoojfekhnkhdbieeh";
      }
      {
        # Return Youtube Dislikes
        id = "gebbhagfogifgggkldgodflihgfeippi";
      }
      {
        # Sponsorblock
        id = "mnjggcdmjocbbbhaepdhchncahnbgone";
      }
      {
        # UBlock Origin
        id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";
      }
      {
        # Unhook
        id = "khncfooichmfjbepaaaebmommgaepoid";
      }
      {
        # Vimium
        id = "dbepggeogbaibhgnhhndojpepiihcmeb";
      }
      {
        # Just Black (Theme)
        id = "aghfnjkcakhmadgdomlmlhhaocbkloab";
      }
    ];
  };
}
