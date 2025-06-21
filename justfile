deploy:
	nixos-rebuild switch --flake . --use-remote-sudo

test:
	nixos-rebuild test --flake . --use-remote-sudo

update:
	nix flake update

update-and-commit:
	nix flake update && git add flake.lock && git commit -m "chore: update flake.lock"
