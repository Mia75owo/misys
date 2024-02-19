DISK="/dev/sda"

# Ask for confirmation
read -r -d '' WARNING <<- EOM
WARNING:
This script will install the config and can be dangerous!
Make sure to change to config on top of this script!
Are you sure you want to continue? 
(y/n):
EOM

read -p "$WARNING" -n 1 -r
echo

# Check confirmation
if [[ $REPLY =~ ^[Yy]$ ]]
then

  # Install system
  nix --experimental-features "nix-command flakes" run github:nix-community/disko -- --mode disko ./nixos/impermanence/disko.nix --arg device '"'$DISK'"'
  nixos-generate-config --root /mnt --no-filesystems
  cp -r . /mnt/persist/misys
  cp /mnt/etc/nixos/hardware-configuration.nix /mnt/persist/misys/nixos/hardware-configuration.nix
  nixos-install --root /mnt --flake path:/mnt/persist/misys#nixos

fi
