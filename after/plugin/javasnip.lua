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


ls.add_snippets("java", {
    --creating class
    s("class", fmt([[
    class {} {{
        {}
    }}
    ]],
    {
        i(1, "ClassName"),
        i(2, "/* Code Goes Here */")
    })),
    --function
        s("fn", fmt(
    [[
    /**
    {}
     *
     * @return {}
     */

    {} {} {}({}) {{
            {}
        }}
    ]], {
        --updates the description automatically
        --function node: splits the params into an table (array of arrays)
        --loops through it and appends @param
        --returns the entire table
        f(function(import_name)
            local parts = vim.split(import_name[1][1], ", ", true)
            local annotated_parts = {}
            for _, part in ipairs(parts) do
                table.insert(annotated_parts, " * @param " .. part)
            end
            return annotated_parts;
        end, {4}), --taking input from i(4, "params")
        rep(2),
        c(1, {
            t("public"),
            t("private")
        }),
        c(2, {
            t("void"),
            t("int"),
            t("double"),
            t("boolean"),
            t("String"),
            t("char"),
        }),
        i(3, "myFunc"),
        i(4, "params"),
        i(5, "/* Code Goes Here */")
    }
    )),
s("for+", fmt(
    [[
    for (int i = 0; i < {}; i++) {{
        {}
    }}
    ]], {
        i(1, "args"),
        i(2, "/* Code Goes Here */")
    }
    ))
})

