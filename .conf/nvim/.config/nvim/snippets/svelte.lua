local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("svelte", {
	s("kstate", {
		t("let "),
		i(1),
		t(" = $state("),
		i(2),
		t(")"),
	}),
})
