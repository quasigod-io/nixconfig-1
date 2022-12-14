{ config, pkgs, inputs, ... }:
{
	imports = [
		./packages/osx
	];
	
	# Enable the usage of proprietary/unfree packages repository.
	nixpkgs.config.allowUnfree = true;
	
	# Enable flakes
	nix = {
		package = pkgs.nixVersions.unstable;
		registry.nixpkgs.flake = inputs.nixpkgs;
		settings = {
			auto-optimise-store = true;
			trusted-users = [ "root" "cullvox" ];
		};
		extraOptions = ''
			experimental-features = nix-command flakes
		'';
		gc = {
			automatic = true;
			options = "-d";
		};
	};
	services.nix-daemon.enable = true;
}
