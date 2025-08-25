vim.api.nvim_create_user_command("InvertCmpColors", function()
	-- invert the cmp colors!
	local cmp_colors = {
		-- "CmpItemAbbr",
		-- "CmpItemAbbrMatch",
		-- "CmpItemAbbrMatchFuzzy",
		-- "CmpItemMenu",
		"CmpItemKindInterface",
		"CmpItemKindColor",
		"CmpItemKindTypeParameter",
		"CmpItemKindText",
		"CmpItemKindEnum",
		"CmpItemKindKeyword",
		"CmpItemKindConstant",
		"CmpItemKindConstructor",
		"CmpItemKindReference",
		"CmpItemKindFunction",
		"CmpItemKindStruct",
		"CmpItemKindClass",
		"CmpItemKindModule",
		"CmpItemKindOperator",
		"CmpItemKindField",
		"CmpItemKindProperty",
		"CmpItemKindEvent",
		"CmpItemKindUnit",
		"CmpItemKindSnippet",
		"CmpItemKindFolder",
		"CmpItemKindVariable",
		"CmpItemKindFile",
		"CmpItemKindMethod",
		"CmpItemKindValue",
		"CmpItemKindEnumMember",
	}
	for _, color in ipairs(cmp_colors) do
		local hl = vim.api.nvim_get_hl(0, { name = color })
		local new_hl = {}
		if hl.fg then
			new_hl.bg = hl.fg
		end
		if hl.bg then
			new_hl.fg = hl.bg
		end
		for _, attr in ipairs({ "bold", "italic", "underline", "undercurl", "reverse", "strikethrough" }) do
			if hl[attr] ~= nil then
				new_hl[attr] = hl[attr]
			end
		end
		vim.api.nvim_set_hl(0, color, new_hl)
	end
end, { desc = "test!" })
