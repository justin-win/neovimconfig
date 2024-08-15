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
local fmta = require("luasnip.extras.fmt").fmta
local c = ls.choice_node
local sn = ls.snippet_node
local d = ls.dynamic_node
local r = ls.restore_node

ls.add_snippets("javascript", {
    s("fn", c(1, {
        sn(nil, fmt([[
        local {} = function({}) {{
            {}
        }}
        ]], {i(1, "myFunc"), i(2, "params"), i(3, "//Code goes here")})
        ),
        sn(nil, fmt([[
        function {}({}) {{
            {}
        }}
        ]], {i(1, "myFunc"), i(2, "params"), i(3, "//Code goes here")}))
    })),

    s("dqs", fmt(
    [[
    {} {} = document.querySelector('{}');
    ]],
    {
        c(1, {
            t("const"),
            t("let")
        }),
        i(2, "name"),
        i(3, "doc")
    }
    )),
    s("dcc", fmt([[
    const {} = document.createElement('{}');
    ]], {
        i(1, "name"),
        i(2, "type")
    })),
    s("ael", fmt([[
    {}.addEventListener('{}', {});
    ]], {
        i(1, "name"),
        c(2, {
            t("click"),
            t("unload")
            --TODO more
        }),
        c(3, {
            sn(nil, fmt([[
            ({}) => {{
                {}
            }}
            ]], {i(1), i(2, "//Code goes here")})),
            i(nil, "myFunc")
        })
    }
    ))


})
ls.add_snippets("html", {
    s("html5", fmt(
    [[
    <!DOCTYPE html>
        <html lang="en-US">
            <head>
                <meta charset="utf-8">
                <title>{}</title>
                <link rel="stylesheet" href="{}">
                <script src="{}" defer></script>
            </head>
            <body>
                {}
            </body>
        </html>
    ]],
    {
        i(1, "title"),
        i(2, "css/style.css"),
        i(3, "js-file.js"),
        i(4),
    }
    ))
})

