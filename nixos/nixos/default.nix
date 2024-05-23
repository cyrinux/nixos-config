{pkgs, inputs,...}: {
  imports = [
    inputs.apple-silicon-support.nixosModules.apple-silicon-support
    # Include the results of the hardware scan.
    ./hardware.nix
    #<apple-silicon-support/apple-silicon-support>

    ../common

    #./android.nix
    #./autofs.nix
    #./bluetooth.nix
    #./neovim.nix
    #./obs.nix
    #./packages.nix
    #./sound.nix
    #./thunar.nix
    #./wayland.nix
    #./wireguard
  ];

  networking.hostName = "nixos";
  age.rekey.hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIM+Md7yZTk3GWd0XVRQkplboDPLGkSqE/o6/SsfrrGGS";

  # Asahi hardware
  hardware.asahi = {
    peripheralFirmwareDirectory = ./firmware;
    useExperimentalGPUDriver = true;
    experimentalGPUInstallMode = "overlay";
  };
  
  # Sharing pulseaudio server
  networking.firewall.allowedTCPPorts = [4713];

  networking.wireless.iwd = {
    enable  = true;
    settings.General.EnableNetworkConfiguration = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    (nerdfonts.override {
      fonts = [
        "DejaVuSansMono"
        "UbuntuMono"
      ];
    })
  ];
  
  zramSwap = {
    enable = true;
  };
  
  services = {
    gnome.gnome-keyring.enable = true;
    udisks2.enable = true;

    # Disable fingerprint sensor
    fprintd.enable = false;

    # Default is "poweroff" which shutdowns the laptop as soon as the power button is pressed.
    logind.powerKey = "lock";
  };

  # Some programs need SUID wrappers, can be configured further or are started in user sessions.
  programs.dconf.enable = true;

  system = {
    autoUpgrade.enable = false;

    # This value determines the NixOS release from which the default
    # settings for stateful data, like file locations and database versions
    # on your system were taken. It‘s perfectly fine and recommended to leave
    # this value at the release version of the first install of this system.
    # Before changing this value read the documentation for this option
    # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
    stateVersion = "24.05"; # Did you read the comment?
  };
}
