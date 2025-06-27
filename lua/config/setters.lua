-- lua/config/setters.lua

local o = vim.opt

-- 📌 Numeração e destaque de linha
o.number           = true     -- mostrar número de linha
o.relativenumber   = true     -- números relativos
o.cursorline       = true     -- destacar a linha atual
o.signcolumn       = "yes"    -- coluna de sinais sempre visível

-- 🔍 Busca aprimorada
o.hlsearch         = true     -- destacar resultados da busca
o.incsearch        = true     -- busca incremental enquanto digita
o.ignorecase       = true     -- ignorar maiúsculas/minúsculas
o.smartcase        = true     -- case-sensitive se usar maiúsculas

-- 🖱️ Interface & comportamento
--o.mouse            = ""      -- habilita mouse em todos os modos
o.clipboard        = "unnamedplus"  -- usar clipboard do sistema
o.scrolloff        = 5        -- manter 5 linhas ao rolar
o.splitright       = true     -- splits verticais à direita
o.splitbelow       = true     -- splits horizontais abaixo

-- 🪶 Indentação e caracteres invisíveis
o.expandtab        = true     -- converter Tab em espaços
o.shiftwidth       = 2        -- largura da indentação automática
o.tabstop          = 2        -- largura da tabulação
o.softtabstop      = 2        -- largura do tab backward
o.autoindent       = true     -- manter indent da linha anterior
o.list             = true     -- mostrar caracteres invisíveis
o.listchars        = { tab="| "--[[, trail="."]] }  -- símbolos visuais

-- 🧩 Configurações gerais úteis
o.termguicolors    = true     -- cores truecolor
o.wrap             = false    -- desativar quebra automática de linha
o.linebreak        = true     -- não quebrar no meio de palavras
o.updatetime       = 250      -- menor tempo para CursorHold
o.completeopt      = {"menuone", "noselect"}  -- completamento limpo
o.foldmethod       = "indent" -- dobrar por indentação
o.foldlevelstart   = 99       -- abrir com dobras desdobradas

