{
  description = "Deployment infrastructure for hello-flake";
  inputs = {
    hello.url = "github:balsoft/hello-flake";
    hello.inputs.nixpkgs.follows = "nixpkgs";
  };
  outputs = { self, nixpkgs, hello }: {
    nixosConfigurations.hello = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        {
          nixpkgs.overlays = [ hello.overlay ];
          services.hello.enable = true;
        }
        ./shim.nix
        hello.nixosModules.hello
      ];
    };
  };
}
