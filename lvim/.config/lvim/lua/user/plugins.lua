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
	{
		"zbirenbaum/copilot.lua", -- https://github.com/zbirenbaum/copilot.lua/blob/master/README.md#setup-and-configuration
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
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
						-- accept = "<Tab>",
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
	{
		"zbirenbaum/copilot-cmp", -- https://github.com/zbirenbaum/copilot-cmp/blob/master/README.md#configuration
		after = { "copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
	{
		"p00f/clangd_extensions.nvim",
		-- config = function()
		-- 	require("clangd_extensions").setup({
		-- 		server = {
		-- 			-- options to pass to nvim-lspconfig
		-- 			-- i.e. the arguments to require("lspconfig").clangd.setup({})
		-- 		},
		-- 		extensions = {
		-- 			-- defaults:
		-- 			-- Automatically set inlay hints (type hints)
		-- 			autoSetHints = true,
		-- 			-- These apply to the default ClangdSetInlayHints command
		-- 			inlay_hints = {
		-- 				inline = vim.fn.has("nvim-0.10") == 1,
		-- 				-- Options other than `highlight' and `priority' only work
		-- 				-- if `inline' is disabled
		-- 				-- Only show inlay hints for the current line
		-- 				only_current_line = false,
		-- 				-- Event which triggers a refersh of the inlay hints.
		-- 				-- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
		-- 				-- not that this may cause  higher CPU usage.
		-- 				-- This option is only respected when only_current_line and
		-- 				-- autoSetHints both are true.
		-- 				only_current_line_autocmd = "CursorHold",
		-- 				-- whether to show parameter hints with the inlay hints or not
		-- 				show_parameter_hints = true,
		-- 				-- prefix for parameter hints
		-- 				parameter_hints_prefix = "<- ",
		-- 				-- prefix for all the other hints (type, chaining)
		-- 				other_hints_prefix = "=> ",
		-- 				-- whether to align to the length of the longest line in the file
		-- 				max_len_align = false,
		-- 				-- padding from the left if max_len_align is true
		-- 				max_len_align_padding = 1,
		-- 				-- whether to align to the extreme right or not
		-- 				right_align = false,
		-- 				-- padding from the right if right_align is true
		-- 				right_align_padding = 7,
		-- 				-- The color of the hints
		-- 				highlight = "Comment",
		-- 				-- The highlight group priority for extmark
		-- 				priority = 100,
		-- 			},
		-- 			ast = {
		-- 				-- These are unicode, should be available in any font
		-- 				role_icons = {
		-- 					type = "🄣",
		-- 					declaration = "🄓",
		-- 					expression = "🄔",
		-- 					statement = ";",
		-- 					specifier = "🄢",
		-- 					["template argument"] = "🆃",
		-- 				},
		-- 				kind_icons = {
		-- 					Compound = "🄲",
		-- 					Recovery = "🅁",
		-- 					TranslationUnit = "🅄",
		-- 					PackExpansion = "🄿",
		-- 					TemplateTypeParm = "🅃",
		-- 					TemplateTemplateParm = "🅃",
		-- 					TemplateParamObject = "🅃",
		-- 				},
		-- 				--[[ These require codicons (https://github.com/microsoft/vscode-codicons)
		--           role_icons = {
		--               type = "",
		--               declaration = "",
		--               expression = "",
		--               specifier = "",
		--               statement = "",
		--               ["template argument"] = "",
		--           },

		--           kind_icons = {
		--               Compound = "",
		--               Recovery = "",
		--               TranslationUnit = "",
		--               PackExpansion = "",
		--               TemplateTypeParm = "",
		--               TemplateTemplateParm = "",
		--               TemplateParamObject = "",
		--           }, ]]

		-- 				highlights = {
		-- 					detail = "Comment",
		-- 				},
		-- 			},
		-- 			memory_usage = {
		-- 				border = "none",
		-- 			},
		-- 			symbol_info = {
		-- 				border = "none",
		-- 			},
		-- 		},
		-- 	})
		-- end,
	},
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
	{ url = "git@github.com:LunarVim/primer.nvim.git" },
	{ url = "git@github.com:ChristianChiarulli/onedark.nvim.git" },
	"Mofiqul/vscode.nvim",
	"HiPhish/nvim-ts-rainbow2",
	-- {
	-- 	"lvimuser/lsp-inlayhints.nvim",
	-- 	config = function()
	-- 		vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
	-- 		vim.api.nvim_create_autocmd("LspAttach", {
	-- 			group = "LspAttach_inlayhints",
	-- 			callback = function(args)
	-- 				if not (args.data and args.data.client_id) then
	-- 					return
	-- 				end

	-- 				local bufnr = args.buf
	-- 				local client = vim.lsp.get_client_by_id(args.data.client_id)
	-- 				require("lsp-inlayhints").on_attach(client, bufnr)
	-- 			end,
	-- 		})
	-- 		local status_ok, hints = pcall(require, "lsp-inlayhints")
	-- 		if not status_ok then
	-- 			return
	-- 		end
	-- 		hints.setup({
	-- 			inlay_hints = {
	-- 				parameter_hints = {
	-- 					show = true,
	-- 					prefix = "<- ",
	-- 					separator = ", ",
	-- 					remove_colon_start = false,
	-- 					remove_colon_end = true,
	-- 				},
	-- 				type_hints = {
	-- 					-- type and other hints
	-- 					show = true,
	-- 					prefix = "",
	-- 					separator = ", ",
	-- 					remove_colon_start = false,
	-- 					remove_colon_end = false,
	-- 				},
	-- 				only_current_line = false,
	-- 				-- separator between types and parameter hints. Note that type hints are
	-- 				-- shown before parameter
	-- 				labels_separator = "  ",
	-- 				-- whether to align to the length of the longest line in the file
	-- 				max_len_align = false,
	-- 				-- padding from the left if max_len_align is true
	-- 				max_len_align_padding = 1,
	-- 				-- highlight group
	-- 				highlight = "comment",
	-- 				-- virt_text priority
	-- 				priority = 0,
	-- 			},
	-- 			enabled_at_startup = true,
	-- 			debug_mode = false,
	-- 		})
	-- 	end,
	-- },
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					backdrop = 0.95, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
					-- height and width can be:
					-- * an absolute number of cells when > 1
					-- * a percentage of the width / height of the editor when <= 1
					-- * a function that returns the width or the height
					width = 127, -- width of the Zen window
					height = 1, -- height of the Zen window
					-- by default, no options are changed for the Zen window
					-- uncomment any of the options below, or add other vim.wo options you want to apply
					options = {
						-- signcolumn = "no", -- disable signcolumn
						-- number = false, -- disable number column
						-- relativenumber = false, -- disable relative numbers
						-- cursorline = false, -- disable cursorline
						-- cursorcolumn = false, -- disable cursor column
						-- foldcolumn = "0", -- disable fold column
						-- list = false, -- disable whitespace characters
					},
				},
				plugins = {
					-- disable some global vim options (vim.o...)
					-- comment the lines to not apply the options
					options = {
						enabled = true,
						ruler = false, -- disables the ruler text in the cmd line area
						showcmd = false, -- disables the command in the last line of the screen
					},
					twilight = { enabled = true }, -- enable to start Twilight when zen mode opens
					gitsigns = { enabled = false }, -- disables git signs
					tmux = { enabled = true }, -- disables the tmux statusline
					-- this will change the font size on kitty when in zen mode
					-- to make this work, you need to set the following kitty options:
					-- - allow_remote_control socket-only
					-- - listen_on unix:/tmp/kitty
					kitty = {
						enabled = false,
						font = "+4", -- font size increment
					},
					-- this will change the font size on alacritty when in zen mode
					-- requires  Alacritty Version 0.10.0 or higher
					-- uses `alacritty msg` subcommand to change font size
					alacritty = {
						enabled = false,
						font = "14", -- font size
					},
					-- this will change the font size on wezterm when in zen mode
					-- See alse also the Plugins/Wezterm section in this projects README
					wezterm = {
						enabled = false,
						-- can be either an absolute font size or the number of incremental steps
						font = "+4", -- (10% increase per step)
					},
				},
				-- callback where you can add custom code when the Zen window opens
				on_open = function(win) end,
				-- callback where you can add custom code when the Zen window closes
				on_close = function() end,
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		config = function()
			require("nvim-treesitter.configs").setup({
				textobjects = {
					select = {
						enable = true,

						-- Automatically jump forward to textobj, similar to targets.vim
						lookahead = true,

						keymaps = {
							-- You can use the capture groups defined in textobjects.scm
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ac"] = "@class.outer",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
						},
						-- You can choose the select mode (default is charwise 'v')
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * method: eg 'v' or 'o'
						-- and should return the mode ('v', 'V', or '<c-v>') or a table
						-- mapping query_strings to modes.
						-- selection_modes = {
						-- 	["@parameter.outer"] = "v", -- charwise
						-- 	["@function.outer"] = "V", -- linewise
						-- 	["@class.outer"] = "<c-v>", -- blockwise
						-- },
						-- If you set this to `true` (default is `false`) then any textobject is
						-- extended to include preceding or succeeding whitespace. Succeeding
						-- whitespace has priority in order to act similarly to eg the built-in
						-- `ap`.
						--
						-- Can also be a function which gets passed a table with the keys
						-- * query_string: eg '@function.inner'
						-- * selection_mode: eg 'v'
						-- and should return true of false
						include_surrounding_whitespace = true,
					},
					swap = {
						enable = false,
						swap_next = {
							["<leader>a"] = "@parameter.inner",
						},
						swap_previous = {
							["<leader>A"] = "@parameter.inner",
						},
					},
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = "@function.outer",
							-- ["]]"] = { query = "@class.outer", desc = "Next class start" },
							--
							-- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
							-- ["]o"] = "@loop.*",
							-- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
							--
							-- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
							-- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
							-- ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
							-- ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
						},
						goto_next_end = {
							["]F"] = "@function.outer",
							-- ["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							-- ["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							-- ["[]"] = "@class.outer",
						},
						-- Below will go to either the start or the end, whichever is closer.
						-- Use if you want more granular movements
						-- Make it even more gradual by adding multiple queries and regex.
						-- goto_next = {
						-- 	["]d"] = "@conditional.outer",
						-- },
						-- goto_previous = {
						-- 	["[d"] = "@conditional.outer",
						-- },
					},
				},
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			local opts = {
				highlight_hovered_item = true,
				show_guides = true,
				auto_preview = false,
				position = "right",
				relative_width = true,
				width = 25,
				auto_close = false,
				show_numbers = false,
				show_relative_numbers = false,
				show_symbol_details = true,
				preview_bg_highlight = "Pmenu",
				autofold_depth = nil,
				auto_unfold_hover = true,
				fold_markers = { "", "" },
				wrap = false,
				keymaps = { -- These keymaps can be a string or a table for multiple keys
					close = { "<Esc>", "q" },
					goto_location = "<Cr>",
					focus_location = "o",
					hover_symbol = "<C-space>",
					toggle_preview = "K",
					rename_symbol = "r",
					code_actions = "a",
					fold = "h",
					unfold = "l",
					fold_all = "W",
					unfold_all = "E",
					fold_reset = "R",
				},
				lsp_blacklist = {},
				symbol_blacklist = {},
				symbols = {
					File = { icon = "", hl = "@text.uri" },
					Module = { icon = "", hl = "@namespace" },
					Namespace = { icon = "", hl = "@namespace" },
					Package = { icon = "", hl = "@namespace" },
					Class = { icon = "𝓒", hl = "@type" },
					Method = { icon = "ƒ", hl = "@method" },
					Property = { icon = "", hl = "@method" },
					Field = { icon = "", hl = "@field" },
					Constructor = { icon = "", hl = "@constructor" },
					Enum = { icon = "ℰ", hl = "@type" },
					Interface = { icon = "ﰮ", hl = "@type" },
					Function = { icon = "", hl = "@function" },
					Variable = { icon = "", hl = "@constant" },
					Constant = { icon = "", hl = "@constant" },
					String = { icon = "𝓐", hl = "@string" },
					Number = { icon = "#", hl = "@number" },
					Boolean = { icon = "⊨", hl = "@boolean" },
					Array = { icon = "", hl = "@constant" },
					Object = { icon = "⦿", hl = "@type" },
					Key = { icon = "🔐", hl = "@type" },
					Null = { icon = "NULL", hl = "@type" },
					EnumMember = { icon = "", hl = "@field" },
					Struct = { icon = "𝓢", hl = "@type" },
					Event = { icon = "🗲", hl = "@type" },
					Operator = { icon = "+", hl = "@operator" },
					TypeParameter = { icon = "𝙏", hl = "@parameter" },
					Component = { icon = "", hl = "@function" },
					Fragment = { icon = "", hl = "@constant" },
				},
			}
			require("symbols-outline").setup(opts)
		end,
	},
	"lunarvim/darkplus.nvim",
}
