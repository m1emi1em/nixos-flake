{
  nixpkgs.config = {
    allowUnfree = true;

    permittedInsecurePackages = [
      "electron-27.3.11" # Hecking logseq wth
    ];
  };
  # inputs.nixpkgs-unstable.config = {
  #   allowUnfree = true;
  # };
}
