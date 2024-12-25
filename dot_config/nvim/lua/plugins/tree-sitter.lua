return {
  {
    'nvim-treesitter/nvim-treesitter',
    name = 'tree-sitter',
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
            "bash", "make", "diff",
            "dockerfile",
            "gitignore",
            "go", "gomod", "gosum", "proto", "rust", "sql", "zig",
            "html", "javascript", "typescript",
            "json", "toml", "yaml",
            "lua", "vim",
            "ssh_config",
            "typst",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
  }
}
