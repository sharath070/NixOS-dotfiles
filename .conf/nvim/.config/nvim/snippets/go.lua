local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("go", {
	s("ier", {
		t({ "if err != nil {", "\treturn " }),
		i(1),
		t(" err"),
		t({ "", "}" }),
	}),
})
