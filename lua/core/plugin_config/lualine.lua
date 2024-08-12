require('lualine').setup {
	options = {
		icons_enabled = true,
		theme = 'gruvbox',
	},


	sections = {
		lualine_a = {
			{
				'filename',
				path = 1,
			}
		}
	},
	lualine_x = {
		{
			'diagnostics',
			sources = { "coc" },
			sections = { 'error', 'warn', 'info', 'hint' },
			colored = true,
			symbols = { error = ' ', warn = ' ', info = ' ', hint = '' },
			diagnostics_color = {
				warn = { fg = '#ffa500' },
			}
		},
		'encoding', 'filetype'
	},
}
