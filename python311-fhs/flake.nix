{
  description = "A very basic python 3.11 flake in an FHS environment which works for development with pytorch";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-25.05";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {system = "${system}";};
        simplePythonEnv = pkgs.python311.withPackages (ps: with ps; [pip virtualenv]);
      in {
        devShell =
          (
            pkgs.buildFHSEnv
            {
              name = "python-311-fhs env";
              targetPkgs = p: [simplePythonEnv p.libGL p.glib];
            }
          )
          .env;
      }
    );
}
