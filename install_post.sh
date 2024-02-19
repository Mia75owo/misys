if [ ! -d "/persist/home" ]; then
  sudo mkdir /persist/home
  sudo chmod -R $(id -u):$(id -g)
fi
