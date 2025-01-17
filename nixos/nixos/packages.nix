{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Misc (system utilities)
    killall
    nfs-utils # Linux user-space NFS utilities

    # Network
    dig # Domain name server
    lsof
    wol # Wake on Lan

    # Software development
    git

    # CLI utilities
    file
    ncdu
    tree
    unzip
    wget
    zip

    # Multimedia
    ffmpeg
    ffmpegthumbnailer
    gthumb
    imagemagick
 #   mpv
 #   vlc

#    chromium

    # Hardware Monitoring
    htop
  ];
}
