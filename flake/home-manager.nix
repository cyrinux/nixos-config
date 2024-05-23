{
  inputs,
  homeManagerModules,
  ...
}: {
  _module.args = {
    homeManagerModules = hostname: [
      inputs.nix-index-database.hmModules.nix-index
      ../home/hosts/${hostname}
    ];
  };
}
