{
    inputs = {
        nixpkgs.url = "github:NixOS/nixpkgs/?ref=nixos-25.11";
    };

    outputs = { nixpkgs, ... }@inputs:
        let
            system = "x86_64-linux";
            pkgs = nixpkgs.legacyPackages.${system};
        in {
            devShells.${system}.default = pkgs.mkShell {
                buildInputs = with pkgs; [
                    odin
                ];
            };
        };
}
