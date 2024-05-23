{pkgs, ...}: {
  programs.adb.enable = true;

  environment.systemPackages = with pkgs; [
    jmtpfs
  ];

  users.users.cyril.extraGroups = ["adbusers"];
}
