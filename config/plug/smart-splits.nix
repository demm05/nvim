{ lib, config, ... }:
{
  plugins.smart-splits = {
    enable = true;
  };
  keymaps = lib.mkIf config.plugins.smart-splits.enable [
    {
      mode = "n";
      key = "<C-h>";
      action.__raw = "require('smart-splits').move_cursor_left";
      options = {
        desc = "Navigate Left (Smart Splits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-j>";
      action.__raw = "require('smart-splits').move_cursor_down";
      options = {
        desc = "Navigate Down (Smart Splits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-k>";
      action.__raw = "require('smart-splits').move_cursor_up";
      options = {
        desc = "Navigate Up (Smart Splits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<C-l>";
      action.__raw = "require('smart-splits').move_cursor_right";
      options = {
        desc = "Navigate Right (Smart Splits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-h>";
      action.__raw = "require('smart-splits').resize_left";
      options = {
        desc = "Resize Left (Smart Splits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-j>";
      action.__raw = "require('smart-splits').resize_down";
      options = {
        desc = "Resize Down (Smart Splits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-k>";
      action.__raw = "require('smart-splits').resize_up";
      options = {
        desc = "Resize Up (Smart Splits)";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<A-l>";
      action.__raw = "require('smart-splits').resize_right";
      options = {
        desc = "Resize Right (Smart Splits)";
        silent = true;
      };
    }
  ];
}
