{
  programs.neovim = {
    enable = true;
    configure = {
      customRC = ''
        nnoremap ; :
        set number
        set relativenumber
        set expandtab
        set shiftwidth=2
    '';
    };
    viAlias = true;
    vimAlias = true;
    defaultEditor =  true;
  };
}
