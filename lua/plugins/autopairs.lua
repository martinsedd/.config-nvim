return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		lazy = false,
		opts = {
			check_ts = true,
			ts_config = {
				lua = { "string" },
				javascript = { "template_string" },
				java = false,
			},
		},
		config = function(_, opts)
			local ok, npairs = pcall(require, "nvim-autopairs")
			if not ok then
				return
			end

			npairs.setup(opts)

			local cmp_ok, cmp = pcall(require, "cmp")
			if cmp_ok then
				local cmp_autopairs = require("nvim-autopairs.completion.cmp")
				cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
			end
		end,
	},
}
