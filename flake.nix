{
	description = "matrix-docker-ansible-deploy";

	outputs = { self, nixpkgs, ... }: {
		# NIXPKGS_ALLOW_UNFREE=1 nix develop --impure
		devShells.x86_64-darwin.default = nixpkgs.legacyPackages.x86_64-darwin.mkShell {
			buildInputs = with nixpkgs.legacyPackages.x86_64-darwin; [
				python310
				ansible
				_1password
			];
			shellHook = ''
			eval $(op signin my)
			'';
			};
		};
}
