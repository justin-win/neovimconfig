if vim.g.snippets == "luasnip" then
    return
end

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local extras = require("luasnip.extras")
local rep = extras.rep
local types = require("luasnip.util.types")
local fmt = require("luasnip.extras.fmt").fmt
local c = ls.choice_node

--expand snippet
vim.keymap.set({"i"}, "<C-K>", function() ls.expand() end, {silent = true})
--
vim.keymap.set({"i", "s"}, "<C-L>", function() ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() ls.jump(-1) end, {silent = true})

vim.keymap.set({"i", "s"}, "<C-E>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

ls.add_snippets("html", {
    s("html:5", fmt(
    [[
    <!DOCTYPE html>
        <html lang="en">
            <head>
                <meta charset="utf-8">
                <title>{}</title>
                <link rel="stylesheet" href="{}">
            </head>
            <body>
                {}
            </body>
        </html>
    ]],
    {
        i(1, "title"),
        i(2, "css/style.css"),
        i(3)
    }
    ))
})

ls.add_snippets("java", {
    s("class", fmt([[
    class {} {{
        {}
    }}
    ]],
    {
        i(1, "ClassName"),
        i(2, "/* Code Goes Here */")
    })),
    s("fn", fmt(
    [[
    /**
     * Parameters: {}
     *
     * @param {}
     * @param {}
     *
     * @return {}
     */

        {} {} {}() {{
            {}
        }}
    ]],
    {
        i(1),
        i(2),
        i(3),
        i(4),
        c(5, {
            t("public"),
            t("private")
        }),
        c(6, {
            t("void"),
            t("int"),
            t("double"),
            t("boolean"),
            t("String"),
            t("char"),
        }),
        i(7, "myFunc"),
        i(8, "/* Code Goes Here */")
    }
    ))
})




vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
