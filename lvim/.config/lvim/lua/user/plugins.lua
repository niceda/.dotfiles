lvim.plugins = {
	{
		"tpope/vim-surround",
		-- make sure to change the value of `timeoutlen` if it's not triggering correctly, see https://github.com/tpope/vim-surround/issues/117
		-- setup = function()
		--  vim.o.timeoutlen = 500
		-- vim.g.surround_no_insert_mappings = true
		-- end
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},
	{
		"kevinhwang91/nvim-bqf",
		event = { "BufRead", "BufNew" },
		config = function()
			require("bqf").setup({
				auto_enable = true,
				preview = {
					win_height = 12,
					win_vheight = 12,
					delay_syntax = 80,
					border_chars = { "┃", "┃", "━", "━", "┏", "┓", "┗", "┛", "█" },
				},
				func_map = {
					vsplit = "",
					ptogglemode = "z,",
					stoggleup = "",
				},
				filter = {
					fzf = {
						action_for = { ["ctrl-s"] = "split" },
						extra_opts = { "--bind", "ctrl-o:toggle-all", "--prompt", "> " },
					},
				},
			})
		end,
	},
	{ "p00f/nvim-ts-rainbow" },
	{
		"zbirenbaum/copilot-cmp",
		event = "InsertEnter",
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			vim.defer_fn(function()
				require("copilot").setup() -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
				require("copilot_cmp").setup() -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
			end, 100)

			local ok, copilot = pcall(require, "copilot")
			if not ok then
				return
			end

			copilot.setup({
				panel = {
					keymap = {
						jump_next = "<c-j>",
						jump_prev = "<c-k>",
						accept = "<c-l>",
						refresh = "r",
						open = "<M-CR>",
					},
				},
				suggestion = {
					enabled = true,
					auto_trigger = true,
					keymap = {
						accept = "<c-l>",
						next = "<c-j>",
						prev = "<c-k>",
						dismiss = "<c-h>",
					},
				},
				filetypes = {
					yaml = false,
					markdown = true,
					help = false,
					gitcommit = false,
					gitrebase = false,
					hgcommit = false,
					svn = false,
					cvs = false,
					["."] = false,
				},
			})
		end,
	},
	{ "p00f/clangd_extensions.nvim" },
	-- {
	-- 	"Civitasv/cmake-tools.nvim",
	-- 	config = function()
	-- 		require("cmake-tools").setup({
	-- 			cmake_command = "cmake", -- this is used to specify cmake command path
	-- 			cmake_regenerate_on_save = true, -- auto generate when save CMakeLists.txt
	-- 			cmake_generate_options = { "-DCMAKE_EXPORT_COMPILE_COMMANDS=1" }, -- this will be passed when invoke `CMakeGenerate`
	-- 			cmake_build_options = {}, -- this will be passed when invoke `CMakeBuild`
	-- 			cmake_build_directory = "", -- this is used to specify generate directory for cmake
	-- 			cmake_build_directory_prefix = "cmake_build_", -- when cmake_build_directory is set to "", this option will be activated
	-- 			cmake_soft_link_compile_commands = true, -- this will automatically make a soft link from compile commands file to project root dir
	-- 			cmake_compile_commands_from_lsp = false, -- this will automatically set compile commands file location using lsp, to use it, please set `cmake_soft_link_compile_commands` to false
	-- 			cmake_kits_path = nil, -- this is used to specify global cmake kits path, see CMakeKits for detailed usage
	-- 			cmake_variants_message = {
	-- 				short = { show = true }, -- whether to show short message
	-- 				long = { show = true, max_length = 40 }, -- whether to show long message
	-- 			},
	-- 			cmake_dap_configuration = { -- debug settings for cmake
	-- 				name = "cpp",
	-- 				type = "codelldb",
	-- 				request = "launch",
	-- 				stopOnEntry = false,
	-- 				runInTerminal = true,
	-- 				console = "integratedTerminal",
	-- 			},
	-- 			cmake_always_use_terminal = false, -- if true, use terminal for generate, build, clean, install, run, etc, except for debug, else only use terminal for run, use quickfix for others
	-- 			cmake_quickfix_opts = { -- quickfix settings for cmake, quickfix will be used when `cmake_always_use_terminal` is false
	-- 				show = "always", -- "always", "only_on_error"
	-- 				position = "belowright", -- "bottom", "top"
	-- 				size = 10,
	-- 			},
	-- 			cmake_terminal_opts = { -- terminal settings for cmake, terminal will be used for run when `cmake_always_use_terminal` is false or true, will be used for all tasks except for debug when `cmake_always_use_terminal` is true
	-- 				name = "Main Terminal",
	-- 				prefix_name = "[CMakeTools]: ", -- This must be included and must be unique, otherwise the terminals will not work. Do not use a simple spacebar " ", or any generic name
	-- 				split_direction = "horizontal", -- "horizontal", "vertical"
	-- 				split_size = 11,

	-- 				-- Window handling
	-- 				single_terminal_per_instance = true, -- Single viewport, multiple windows
	-- 				single_terminal_per_tab = true, -- Single viewport per tab
	-- 				keep_terminal_static_location = true, -- Static location of the viewport if avialable

	-- 				-- Running Tasks
	-- 				start_insert_in_launch_task = false, -- If you want to enter terminal with :startinsert upon using :CMakeRun
	-- 				start_insert_in_other_tasks = false, -- If you want to enter terminal with :startinsert upon launching all other cmake tasks in the terminal. Generally set as false
	-- 				focus_on_main_terminal = false, -- Focus on cmake terminal when cmake task is launched. Only used if cmake_always_use_terminal is true.
	-- 				focus_on_launch_terminal = false, -- Focus on cmake launch terminal when executable target in launched.
	-- 			},
	-- 		})
	-- 	end,
	-- },
	-- "MunifTanjim/nui.nvim",
	-- "jackMort/ChatGPT.nvim",
}
