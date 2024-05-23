{pkgs, ...}: {
  imports = [
    ./wayland

    ./bg-stream.nix
    ./dunst.nix
    ./email.nix
    ./firefox.nix
    ./flameshot.nix
    ./gtk.nix
    ./rofi.nix
    ./zathura.nix
  ];

  home.packages = with pkgs; [
    libnotify

    ## GUI applications

    # IM
    signal-desktop

    # Office / productivity
    libreoffice-fresh
  ];

  services = {
    blueman-applet.enable = true;
    network-manager-applet.enable = true;
    udiskie = {
      enable = true;
      tray = "never";
    };
  };
}
