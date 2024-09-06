return {
  "windwp/nvim-ts-autotag",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    local autotag = require("nvim-ts-autotag")
    autotag.setup({
      opts = {
        -- defaults
        enable_close = true, -- Auto close tags
        enable_rename = true, -- Auto rename pairs of tags
        enable_close_on_slash = false -- Auto close on trailing </
      }
    })
  end
}
