require("kanagawa").load("wave")


function tokyoNight()
    vim.cmd[[colorscheme tokyonight-night]]
end

function kana()
    vim.cmd("colorscheme kanagawa-wave")
end

function gruvdark()
    vim.o.background = "dark"
    vim.cmd([[colorscheme gruvbox]])
end

