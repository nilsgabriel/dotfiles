set runtimepath+=~/dotfiles/vim

try
  source ~/dotfiles/.vimrcs/basic.vim
  source ~/dotfiles/.vimrcs/filetypes.vim
  source ~/dotfiles/.vimrcs/plugins_config.vim
  source ~/dotfiles/.vimrcs/extended.vim
catch
endtry
