return {
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    opts = {
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns
        local opts = { buffer = bufnr }

        -- navigation
        vim.keymap.set("n", "]h", gs.next_hunk, vim.tbl_extend("force", opts, { desc = "Next hunk" }))
        vim.keymap.set("n", "[h", gs.prev_hunk, vim.tbl_extend("force", opts, { desc = "Prev hunk" }))

        -- actions
        vim.keymap.set("n", "<leader>hs", gs.stage_hunk, vim.tbl_extend("force", opts, { desc = "Stage hunk" }))
        vim.keymap.set("n", "<leader>hr", gs.reset_hunk, vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
        vim.keymap.set("n", "<leader>hS", gs.stage_buffer, vim.tbl_extend("force", opts, { desc = "Stage buffer" }))
        vim.keymap.set("n", "<leader>hu", gs.undo_stage_hunk, vim.tbl_extend("force", opts, { desc = "Undo stage hunk" }))
        vim.keymap.set("n", "<leader>hp", gs.preview_hunk, vim.tbl_extend("force", opts, { desc = "Preview hunk" }))
        vim.keymap.set("n", "<leader>hb", function() gs.blame_line({ full = true }) end, vim.tbl_extend("force", opts, { desc = "Blame line" }))
        vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame, vim.tbl_extend("force", opts, { desc = "Toggle line blame" }))
        vim.keymap.set("n", "<leader>hd", gs.diffthis, vim.tbl_extend("force", opts, { desc = "Diff this" }))
      end,
    },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        size = 20,
        open_mapping = [[<C-\>]],
        direction = "float",
        float_opts = {
          border = "curved",
        },
      })

      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        dir = "git_dir",
        direction = "float",
        float_opts = { border = "curved" },
        on_open = function(term)
          vim.cmd("startinsert!")
        end,
      })

      vim.keymap.set("n", "<leader>lg", function()
        lazygit:toggle()
      end, { desc = "Open LazyGit" })
    end,
  },
}
