return {
  "neanias/everforest-nvim",
  version = false,
  lazy = false,
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("everforest").setup({
      on_highlights = function (hl, palette)
        hl.TSSymbol = { link = "Orange" } -- default is Agua
        -- hl.TSBoolean = { fg = palette.purple, bg = palette.none, bold = true }
      end
    })
  end,
}
