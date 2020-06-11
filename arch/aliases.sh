alias pclean="pacman -Qtd | cut -d ' ' -f1 | xargs sudo pacman -Rs --noconfirm"
