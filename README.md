# nvim-nix-wrapper-modules

Neovim derivation built on top of [nix-wrapper-modules](https://github.com/BirdeeHub/nix-wrapper-modules).

Originally templated from the [neovim example](https://github.com/BirdeeHub/nix-wrapper-modules#neovim)

```bash
nix build .
```

## Usage as a flake input

Add this repo as an input to your flake:

```nix
inputs.nvim-config.url = "github:kainoa-h/nvim-nix-wrapper-modules";
```

### Run directly

```bash
nix run github:kainoa-h/nvim-nix-wrapper-modules
```
