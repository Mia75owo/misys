if [ ! -d "/persist/home" ]; then
  sudo mkdir /persist/home
  sudo chmod -R $(id -u):$(id -g)
  sudo chown -R $(id -un) /persist/misys
  sudo chown -R $(id -un) /persist/home
fi
