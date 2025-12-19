{
  autoCmd = [
    {
      event = "User";
      pattern = "MiniFilesBufferCreate";
      callback.__raw = ''
        function(args)
          local buf_id = args.data.buf_id
          local function map_split(lhs, direction, close_on_file)
            local files = require "mini.files"
            local should_close = close_on_file == nil and true or close_on_file

            local rhs = function()
              local cur_target = files.get_explorer_state().target_window
              local new_target = vim.api.nvim_win_call(cur_target, function()
                vim.cmd(direction .. " split")
                return vim.api.nvim_get_current_win()
              end)

              files.set_target_window(new_target)
              files.go_in { close_on_file = should_close }
            end

            local desc = "Open in " .. direction .. " split"
            if should_close then desc = desc .. " and close" end
            vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
          end

          map_split("<C-w>s", "belowright horizontal")
          map_split("<C-w>v", "belowright vertical")
          map_split("<C-w>t", "tab")

          map_split("<C-w>S", "belowright horizontal", false)
          map_split("<C-w>V", "belowright vertical", false)
          map_split("<C-w>T", "tab", false)
        end
      '';
    }
  ];
}
