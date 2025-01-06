# Installation

```sh
# Clone my dotfiles repository
git clone https://github.com/osmarmora05/dotfiles.git

# Save the current hardware configuration file (check where the dotfiles path is)
mv /etc/nixos/hardware-configuration.nix $HOME/dotfiles/nixos/etc/nixos/

# Remove the existing NixOS configuration to replace it with mine
sudo rm -rf /etc/nixos

# Navigate to the dotfiles directory
cd dotfiles

# Apply the configuration using GNU Stow
stow nixos

# Alternatively, apply the configuration manually if GNU Stow is not available
sudo mv nixos/etc/nixos /etc/nixos

# Rebuild the system configuration and apply the changes
sudo nixos-rebuild switch
```

## Modules

- home-manager: `Enable`
- flake: `Disable`

By the way, I'm very noob :v

# References
- https://github.com/Aylur/dotfiles
- https://gitlab.com/Alxhr0/nixfiles
- https://github.com/ozwaldorf/flake
- https://github.com/willmcpherson2/willos
- https://github.com/wimpysworld/nix-config
- https://github.com/JamesAtIntegratnIO/nix-dotfiles
- https://github.com/stepp1/nix-dots
- https://github.com/gleber/dotfiles