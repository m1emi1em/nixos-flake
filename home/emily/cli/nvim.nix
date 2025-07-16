{...}:
{
  programs.neovim = {
    enable = true;
    extraConfig = ''set mouse=a
nnoremap ; :
set number
'';
  };
  home.shellAliases = {
    nv = "nvim";
  };
}
