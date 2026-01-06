{
  description = "A Nix-flake-based C# development environment";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  inputs.nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
    }:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "x86_64-darwin"
        "aarch64-darwin"
      ];
      forEachSystem =
        f:
        nixpkgs-stable.lib.genAttrs supportedSystems (
          system:
          f {
            pkgs = import nixpkgs-stable { inherit system; };
            pkgsUnstable = import nixpkgs { inherit system; };
          }
        );
    in
    {
      devShells = forEachSystem (
        { pkgs, pkgsUnstable }:
        {
          default = pkgs.mkShell {
            packages = [
              pkgsUnstable.dotnetCorePackages.sdk_8_0
              pkgsUnstable.roslyn-ls
              pkgs.dotnet-ef
            ];

            shellHook = ''
              export DOTNET_ROOT="${pkgs.dotnetCorePackages.sdk_8_0}/share/dotnet"
              export PATH="${pkgs.dotnetCorePackages.sdk_8_0}/bin:$PATH"
            '';
          };
        }
      );
    };
}
