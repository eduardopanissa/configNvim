local M = {} 

function M.toggleNumber()
  if vim.o.number then
    vim.o.number = false 
  else
    vim.o.number = true
  end
end

function M.toggleRelativeNumber()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "term://*",
  callback = function() 
    vim.cmd("startinsert")
  end,
})

local function isTerminalOpen()
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.api.nvim_buf_get_option(buf, "buftype") == "terminal" then
      return win, buf
    end 
  end
  return nill, nill 
end
 
local function openTerminal()
  local file = vim.fn.expand("%:p:h")  
  if file ~= "" then
    vim.cmd("lcd " .. file)
  end
  vim.cmd("split | resize 5 | terminal  powershell")
end

function M.toggleTerminal()
  local win, buf = isTerminalOpen()
  if win and buf then
    vim.api.nvim_win_close(win, true)
    vim.api.nvim_buf_delete(buf,{force = true})
  else
    openTerminal()
  end
end

function M.pyTerm()
  local file = vim.fn.expand("%")
  local path = vim.fn.expand("%:p:h")
  local dir = vim.fs.normalize(path .. "/venv")
  if vim.loop.fs_stat(dir) then
    openTerminal()
    local win, buf = isTerminalOpen()
    if win and buf then
      local cmd = ".\\venv\\Scripts\\Activate.ps1 \r"
      local chan = vim.b.terminal_job_id
      vim.api.nvim_chan_send(chan, cmd)
      vim.api.nvim_chan_send(chan, "python " .. file .. " \r")
    else
      vim.notify("Buffer atual não é terminal", vim.log.levels.ERROR)
    end
  else
    vim.ui.input({ prompt = "Python virtualenv nao exixte \n (Y) executar (N) cancelar: " }, function(key)
      if key == "Y" or key == "y" then
        openTerminal()
        local win, buf = isTerminalOpen()
        if win and buf then
          local chan = vim.b.terminal_job_id
          vim.api.nvim_chan_send(chan, "python " .. file .. " \r")
        else
          vim.notify("Buffer atual não é terminal", vim.log.levels.ERROR)
        end
      elseif key == "N" or key == "n" then
          return
      end
    end)
  end
end

return M 



