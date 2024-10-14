require("mason").setup()
local mason_registry = require('mason-registry')
local vue_language_server_path = mason_registry.get_package('vue-language-server'):get_install_path() ..
    '/node_modules/@vue/language-server'

require("mason-lspconfig").setup({
	ensure_installed = { 'lua_ls', 'rust_analyzer', 'biome', 'ts_ls', 'volar' },
	handlers = {
		function(server_name)
			if server_name == 'volar' then
				require('lspconfig')[server_name].setup {
					init_options = {
						vue = {
							hybridMode = false,
						},
					},
				}
				return
			end
			if server_name == 'ts_ls' then
				require('lspconfig')[server_name].setup {
					init_options = {
						plugins = {
							{
								name = '@vue/typescript-plugin',
								location = vue_language_server_path,
								languages = { 'vue' },
							},
						},
					},
				}
				return
			end
			require('lspconfig')[server_name].setup {}
		end,
	}
})
