{ pkgs, ... }:
{
	environment.systemPackages = with pkgs; [
		gnumake
		gcc
		cmake
	];
}
