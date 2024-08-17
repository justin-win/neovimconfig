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
local rec_ls = function()
    return sn(nil,
        c(1, {
            -- Start with an empty cell
            t(""),
            -- Add a column with the recursive snippet
            sn(nil, {
                t("--"),
                i(1),  -- Placeholder for cell content
                d(2, rec_ls, {}), -- Recursive call to add more columns
            }),
        })
    )
end
ls.add_snippets("markdown", {
    --callouts
    s("co", fmt([[
        > [!{}]
    ]],{
        c(1, {
        i(nil),
        t("tip"),
        t("note"),
        t("todo"),
        t("info"),
        t("question"),
        t("example"),
        t("quote"),
        t("bug"),
        t("success"),
        t("warning"),
        t("failure"),
        t("danger"),
        })
    })),
    --mermaid graphs
    s("mermaid", fmt([[
    ```mermaid
    ---
    title: {}
    ---
    {} {}
        {}
    ```
    ]], {
        i(1, "title"),
        c(2, {
            t("graph"),
            t("sequenceDiagram"),
            t("erDiagram"),
            t("stateDiagram-v2"),
            t("classDiagram")
        }),
        --dynamic node for reading the type of diagram
        --read from choice node 2
        d(3, function(args)
                --parse the type
                local parts = vim.split(args[1][1], " ", true)
                --if graph return direction otherwise nothing
                if (parts[1] == "graph") then
                    return sn(nil, {
                        --1 because first location within SNIPPET NODE not the formatted string
                        c(1, {
                            t("TD"),
                            t("BT"),
                            t("LR"),
                            t("RL")
                        })
                    })
                else
                    return sn(nil, {
                        t("")
                    })
                end
                end, {2}),
        i(4, "inner")
    })),

    -- s("table", {
    --     t({"--", "|"}),
    --     i(1), -- Placeholder for first cell in the first row
    --     d(2, rec_ls, {}), -- Recursive call to add more columns
    --     t({"", "--"}), -- Ending of the table with vertical separator
    -- })
    -- s("table", {
    --
    -- })
})
