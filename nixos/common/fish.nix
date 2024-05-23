{pkgs, ...}: {
  users.users.cyril.shell = pkgs.fish;

  programs.fish.enable = true;

  environment.pathsToLink = ["/share/fish"];
}
