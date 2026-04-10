return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      ensure_installed = {
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "emmet_ls",
        "lua_ls",
        "jsonls",
        "eslint",
        "pyright",
      },
    },
  },
  {
    "hrsh7th/cmp-nvim-lsp",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- configure all servers with shared capabilities
      vim.lsp.config("*", {
        capabilities = capabilities,
      })

      -- server-specific configs
      vim.lsp.config("emmet_ls", {
        filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
      })

      vim.lsp.config("lua_ls", {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            completion = {
              callSnippet = "Replace",
            },
          },
        },
      })

      -- enable all installed servers
      vim.lsp.enable({
        "ts_ls", "html", "cssls", "tailwindcss",
        "emmet_ls", "lua_ls", "jsonls", "eslint", "pyright",
      })

      -- diagnostic signs
      vim.diagnostic.config({
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = "󰠠 ",
            [vim.diagnostic.severity.INFO] = " ",
          },
        },
      })

      -- keymaps on LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local opts = { buffer = ev.buf, silent = true }

          opts.desc = "Show LSP references"
          vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

          opts.desc = "Go to declaration"
          vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

          opts.desc = "Show LSP definitions"
          vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

          opts.desc = "Show LSP implementations"
          vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

          opts.desc = "Show LSP type definitions"
          vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

          opts.desc = "See available code actions"
          vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

          opts.desc = "Smart rename"
          vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

          opts.desc = "Show buffer diagnostics"
          vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

          opts.desc = "Show line diagnostics"
          vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

          opts.desc = "Go to previous diagnostic"
          vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)

          opts.desc = "Go to next diagnostic"
          vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

          opts.desc = "Show documentation for what is under cursor"
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

          opts.desc = "Restart LSP"
          vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)
        end,
      })
    end,
  },
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {},
  },
}
