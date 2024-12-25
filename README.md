# dotfiles

Install with

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply phyrog
```

Configure Chezmoi with `chezmoi edit-config`:

```toml
[data]
  name = "<name>"
  email = "<email>"
  groups = ["go", "rust", "elixir", "node", "python", "zig"]
```
