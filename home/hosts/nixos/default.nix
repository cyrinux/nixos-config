{
  imports = [
    #../../modules/tui
    #../../modules/gui

    ./backup
    ./update.nix
  ];

  home.stateVersion = "24.05";

  # Load the pulseaudio module that enables sharing audio devices with computers on the network.
  programs.zsh.initExtra = ''
    if ! pactl list | grep -q "tcp"; then
        pactl load-module module-native-protocol-tcp > /dev/null
    fi
  '';
}
