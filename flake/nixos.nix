{
  inputs,
  homeManagerModules,
  ...
}: {
  flake.nixosConfigurations = let
    mkHost = hostname:
      inputs.nixpkgs.lib.nixosSystem {
        system = "aarch64-linux";
        specialArgs.inputs = inputs;
        modules = [
          # The system configuration
          ../nixos/${hostname}

          # Home manager configuration
          inputs.home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.cyril.imports = homeManagerModules hostname;
              extraSpecialArgs.inputs = inputs;
            };
          }
        ];
      };
  in {
    nixos = mkHost "nixos";
  };
}
