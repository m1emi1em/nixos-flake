{ pkgs, inputs', ...}:
{
	programs.emacs = {
		enable = true;
		package = pkgs.emacsWithPackagesFromUsePackage {
			config = ./config.org;
			alwaysTangle = true;
			alwaysEnsure = true;
			defaultInitFile = true;
			package = pkgs.emacs-git-pgtk;
		};
	};
}
