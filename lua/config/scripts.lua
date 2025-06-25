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

local isTerminal = false
function openTerminal()
  if not isTerminal then			
	vim.cmd("lcd %:p:h")
	vim.cmd("botright split | resize 10 | terminal powershell") 
	isTerminal = true
  end
end

function M.toggleTerminal()
 if isTerminal then	
    for _, win in ipairs(vim.api.nvim_list_wins()) do
      local buf = vim.api.nvim_win_get_buf(win)
      local buftype = vim.api.nvim_buf_get_option(buf, "buftype")
      if buftype == "terminal" then
        vim.api.nvim_win_close(win, true)
	vim.api.nvim_buf_delete(buf,{force = true})
	isTerminal = false
        break	
      end
    end
 else
    openTerminal()
 end
end

return M 
