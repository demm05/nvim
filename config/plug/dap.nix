{ pkgs, ... }: {
  plugins.dap = {
    enable = true;
    adapters = {
      executables = {
        codelldb = {
          command = "${pkgs.vscode-extensions.vadimcn.vscode-lldb}/share/vscode/extensions/vadimcn.vscode-lldb/adapter/codelldb";
        };
      };
    };
    configurations = {
      cpp = [
        {
          name = "Launch file";
          type = "codelldb";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
      ];
      c = [
        {
          name = "Launch file";
          type = "codelldb";
          request = "launch";
          program.__raw = ''
            function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end
          '';
          cwd = "\${workspaceFolder}";
          stopOnEntry = false;
        }
      ];
    };
  };

  plugins.dap-ui.enable = true;
  plugins.dap-virtual-text.enable = true;
  plugins.dap-python.enable = true;
}
