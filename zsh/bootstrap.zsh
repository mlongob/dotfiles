PATH=~/.dotfiles/bin:${PATH}

# Set paths for Haskell Stack
ghc_path=$(echo /home/mlongob/.stack/programs/*/*/bin)
if [ $? -eq 0 ]; then
    PATH=$ghc_path:${PATH}
fi
unset ghc_path
PATH=~/.local/bin:${PATH}
export PATH
