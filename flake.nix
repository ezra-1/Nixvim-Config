{
  description = "Ezra nixvim configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    nixvim.url = "github:nix-community/nixvim";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ nixvim, flake-parts, nixpkgs, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];

      perSystem = { system, ... }:
        let
          nixvimLib = nixvim.lib.${system};
          nixvimPkgs = nixvim.legacyPackages.${system};

          # System packages only (no vim plugins from nixpkgs)
          pkgs = import nixpkgs {
            inherit system;

            config = {
              # Required for proprietary software (Steam, NVIDIA, etc.)
              allowUnfree = true;

              # Prevents unstable packages from breaking evaluation
              allowBroken = false;
            };
          };

          # nixvim configuration module
          nixvimModule = {
            inherit system;

            module = import ./config;

            extraSpecialArgs = {
              inherit pkgs;
            };
          };

          # Build nixvim
          nvim = nixvimPkgs.makeNixvimWithModule nixvimModule;

        in {
          # Run `nix flake check` to validate config
          checks.default =
            nixvimLib.check.mkTestDerivationFromNixvimModule nixvimModule;

          # Run `nix run .` to launch Neovim
          packages.default = nvim;
        };
    };
}
