deploy:
	nixos-rebuild switch --flake . --use-remote-sudo

test:
	nixos-rebuild test --flake . --use-remote-sudo

update:
	nix flake update
