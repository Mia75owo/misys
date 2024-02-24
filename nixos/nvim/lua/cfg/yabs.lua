return {
  "pianocomposer321/yabs.nvim",
  -- cmd = { "YabsDefaultTask", "YabsTask" },
  event = "VeryLazy",

  keys = {
    {
      "<A-r>",
      mode = { "n" },
      function()
        require("yabs"):run_task("build_and_run")
      end,
      desc = "Execute the current file (YABS)"
    },
  },

  config = function()
    local function cmd(command)
      local exec =  'zsh -c "' .. command .. '"; zsh -i'
      local final = 'Lspsaga term_toggle ' .. exec:gsub("%s+", "\\ ")
      return final
    end

    require("yabs"):setup({
      languages = {
        rust = {
          tasks = {
            build_and_run = {
              command = cmd 'cargo run',
              type = 'vim',
            }
          }
        }
      },
    })
  end
}
