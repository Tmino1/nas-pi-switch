{
    description = "NAS/Router Pi 5 8gb";

    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
        nixos-hardware.url = "github:NixOS/nixos-hardware";
        nixos-anywhere = {
            url = "github:nix-community/nixos-anywhere";
            inputs.nixpkgs.follows = "nixpkgs";
        };
        disko = {
            url = "github:nix-community/disko";
            inputs.nixpkgs.follows = "nixpkgs";
        };
    };
    outputs = {self, nixpkgs, nixos-hardware, nixos-anywhere, disko}: {
        nixosConfigurations.piserver = nixpkgs.lib.nixosSystem {
            system = "aarch64-linux";
            modules = [
                nixos-hardware.nixosModules.raspberry-pi-4  # swap for raspberry-pi-5 if applicable
                disko.nixosModules.disko
                ./hardware-configuration.nix
                ./disk-config.nix
                ./configuration.nix
            ];
        };
    };
}
