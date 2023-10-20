lvim.plugins = {
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
				keymaps = { -- vim-surround style keymaps
					insert = "<C-g>s",
					insert_line = "<C-g>S",
					normal = "s",
					normal_cur = "ss",
					normal_line = "S",
					normal_cur_line = "SS",
					visual = "s",
					visual_line = "gS",
					delete = "ds",
					change = "cs",
				},
			})
		end,
	},
	-- {
	-- 	"ray-x/lsp_signature.nvim",
	-- 	event = "BufRead",
	-- 	config = function()
	-- 		require("lsp_signature").on_attach()
	-- 	end,
	-- },
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
		-- event = "InsertEnter",
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
			local opts = { noremap = true, silent = true }
			vim.api.nvim_set_keymap(
				"n",
				"<c-t>",
				"<cmd>lua require('copilot.suggestion').toggle_auto_trigger()<CR>",
				opts
			)
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
	-- "HiPhish/nvim-ts-rainbow2",
	"HiPhish/rainbow-delimiters.nvim",
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
							-- ["ac"] = "@class.outer",
							["aa"] = "@parameter.outer",
							["ia"] = "@parameter.inner",
							-- You can optionally set descriptions to the mappings (used in the desc parameter of
							-- nvim_buf_set_keymap) which plugins like which-key display
							-- ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
							-- You can also use captures from other query groups like `locals.scm`
							-- ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
							["at"] = "@class.outer",
							["it"] = "@class.inner",
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
					-- swap = {
					-- 	enable = false,
					-- 	swap_next = {
					-- 		["<leader>a"] = "@parameter.inner",
					-- 	},
					-- 	swap_previous = {
					-- 		["<leader>A"] = "@parameter.inner",
					-- 	},
					-- },
					move = {
						enable = true,
						set_jumps = true, -- whether to set jumps in the jumplist
						goto_next_start = {
							["]f"] = "@function.outer",
							["]]"] = { query = "@class.outer", desc = "Next class start" },
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
							["]["] = "@class.outer",
						},
						goto_previous_start = {
							["[f"] = "@function.outer",
							["[["] = "@class.outer",
						},
						goto_previous_end = {
							["[F"] = "@function.outer",
							["[]"] = "@class.outer",
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
					File = { icon = "󰈚", hl = "@text.uri" },
					Module = { icon = "", hl = "@namespace" },
					Namespace = { icon = "󰌗", hl = "@namespace" },
					Package = { icon = "", hl = "@namespace" },
					Class = { icon = "󰠱", hl = "@type" },
					Method = { icon = "ƒ", hl = "@method" },
					Property = { icon = "", hl = "@method" },
					Field = { icon = "󰜢", hl = "@field" },
					Constructor = { icon = "", hl = "@constructor" },
					Enum = { icon = "ℰ", hl = "@type" },
					Interface = { icon = " ", hl = "@type" },
					Function = { icon = "", hl = "@function" },
					Variable = { icon = "", hl = "@constant" },
					Constant = { icon = "", hl = "@constant" },
					String = { icon = "𝓐", hl = "@string" },
					Number = { icon = "#", hl = "@number" },
					Boolean = { icon = "⊨", hl = "@boolean" },
					Array = { icon = "[]", hl = "@constant" },
					Object = { icon = "⦿", hl = "@type" },
					Key = { icon = "🔐", hl = "@type" },
					Null = { icon = "NULL", hl = "@type" },
					EnumMember = { icon = "", hl = "@field" },
					Struct = { icon = "󰙅", hl = "@type" },
					Event = { icon = "", hl = "@type" },
					Operator = { icon = "󰆕", hl = "@operator" },
					TypeParameter = { icon = "𝙏", hl = "@parameter" },
					Component = { icon = "", hl = "@function" },
					Fragment = { icon = "", hl = "@constant" },
				},
			}
			require("symbols-outline").setup(opts)
		end,
	},
	"lunarvim/darkplus.nvim",
	-- {
	-- 	"tomasky/bookmarks.nvim",
	-- 	event = "VimEnter",
	-- 	config = function()
	-- 		require("bookmarks").setup({
	-- 			-- sign_priority = 8,  --set bookmark sign priority to cover other sign
	-- 			save_file = vim.fn.expand("$HOME/.bookmarks"), -- bookmarks save file path
	-- 			keywords = {
	-- 				["@t"] = "☑️ ", -- mark annotation startswith @t ,signs this icon as `Todo`
	-- 				["@w"] = "⚠️ ", -- mark annotation startswith @w ,signs this icon as `Warn`
	-- 				["@f"] = "⛏ ", -- mark annotation startswith @f ,signs this icon as `Fix`
	-- 				["@n"] = " ", -- mark annotation startswith @n ,signs this icon as `Note`
	-- 			},
	-- 			on_attach = function(bufnr)
	-- 				local bm = require("bookmarks")
	-- 				local map = vim.keymap.set
	-- 				map("n", "mm", bm.bookmark_toggle) -- add or remove bookmark at current line
	-- 				map("n", "mi", bm.bookmark_ann) -- add or edit mark annotation at current line
	-- 				map("n", "mc", bm.bookmark_clean) -- clean all marks in local buffer
	-- 				map("n", "mn", bm.bookmark_next) -- jump to next mark in local buffer
	-- 				map("n", "mp", bm.bookmark_prev) -- jump to previous mark in local buffer
	-- 				map("n", "ml", bm.bookmark_list) -- show marked file list in quickfix window
	-- 			end,
	-- 		})
	-- 		require("telescope").load_extension("bookmarks")
	-- 	end,
	-- },
	{
		"Pocco81/auto-save.nvim",
		config = function()
			require("auto-save").setup({
				enabled = true, -- start auto-save when the plugin is loaded (i.e. when your package manager loads it)
				execution_message = {
					message = function() -- message to print on save
						return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
					end,
					dim = 0.18, -- dim the color of `message`
					cleaning_interval = 1250, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
				},
				trigger_events = { "InsertLeave", "TextChanged" }, -- vim events that trigger auto-save. See :h events
				-- function that determines whether to save the current buffer or not
				-- return true: if buffer is ok to be saved
				-- return false: if it's not ok to be saved
				condition = function(buf)
					local fn = vim.fn
					local utils = require("auto-save.utils.data")

					if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
						return true -- met condition(s), can save
					end
					return false -- can't save
				end,
				write_all_buffers = true, -- write all buffers when the current one meets `condition`
				debounce_delay = 135, -- saves the file at most every `debounce_delay` milliseconds
				callbacks = { -- functions to be executed at different intervals
					enabling = nil, -- ran when enabling auto-save
					disabling = nil, -- ran when disabling auto-save
					before_asserting_save = nil, -- ran before checking `condition`
					before_saving = nil, -- ran before doing the actual save
					after_saving = nil, -- ran after doing the actual save
				},
			})
		end,
	},
	"olexsmir/gopher.nvim",
	"leoluz/nvim-dap-go",
	{
		"neogitorg/neogit",
		config = function()
			local neogit = require("neogit")

			neogit.setup({
				-- Hides the hints at the top of the status buffer
				disable_hint = false,
				-- Disables changing the buffer highlights based on where the cursor is.
				disable_context_highlighting = false,
				-- Disables signs for sections/items/hunks
				disable_signs = false,
				-- Do not ask to confirm the commit - just do it when the buffer is closed.
				disable_commit_confirmation = false,
				-- Changes what mode the Commit Editor starts in. `true` will leave nvim in normal mode, `false` will change nvim to
				-- insert mode, and `"auto"` will change nvim to insert mode IF the commit message is empty, otherwise leaving it in
				-- normal mode.
				disable_insert_on_commit = true,
				-- When enabled, will watch the `.git/` directory for changes and refresh the status buffer in response to filesystem
				-- events.
				filewatcher = {
					interval = 1000,
					enabled = true,
				},
				-- Allows a different telescope sorter. Defaults to 'fuzzy_with_index_bias'. The example below will use the native fzf
				-- sorter instead. By default, this function returns `nil`.
				telescope_sorter = function()
					return require("telescope").extensions.fzf.native_fzf_sorter()
				end,
				-- Persist the values of switches/options within and across sessions
				remember_settings = true,
				-- Scope persisted settings on a per-project basis
				use_per_project_settings = true,
				-- Table of settings to never persist. Uses format "Filetype--cli-value"
				ignored_settings = {
					"NeogitPushPopup--force-with-lease",
					"NeogitPushPopup--force",
					"NeogitPullPopup--rebase",
					"NeogitCommitPopup--allow-empty",
					"NeogitRevertPopup--no-edit",
				},
				-- Neogit refreshes its internal state after specific events, which can be expensive depending on the repository size.
				-- Disabling `auto_refresh` will make it so you have to manually refresh the status after you open it.
				auto_refresh = true,
				-- Value used for `--sort` option for `git branch` command
				-- By default, branches will be sorted by commit date descending
				-- Flag description: https://git-scm.com/docs/git-branch#Documentation/git-branch.txt---sortltkeygt
				-- Sorting keys: https://git-scm.com/docs/git-for-each-ref#_options
				sort_branches = "-committerdate",
				-- Change the default way of opening neogit
				kind = "tab",
				-- Disable line numbers and relative line numbers
				disable_line_numbers = true,
				-- The time after which an output console is shown for slow running commands
				console_timeout = 2000,
				-- Automatically show console if a command takes more than console_timeout milliseconds
				auto_show_console = true,
				status = {
					recent_commit_count = 10,
				},
				commit_editor = {
					kind = "split",
				},
				commit_select_view = {
					kind = "tab",
				},
				commit_view = {
					kind = "vsplit",
					verify_commit = os.execute("which gpg") == 0, -- Can be set to true or false, otherwise we try to find the binary
				},
				log_view = {
					kind = "tab",
				},
				rebase_editor = {
					kind = "split",
				},
				reflog_view = {
					kind = "tab",
				},
				merge_editor = {
					kind = "split",
				},
				preview_buffer = {
					kind = "split",
				},
				popup = {
					kind = "split",
				},
				signs = {
					-- { CLOSED, OPENED }
					hunk = { "", "" },
					item = { ">", "v" },
					section = { ">", "v" },
				},
				-- Each Integration is auto-detected through plugin presence, however, it can be disabled by setting to `false`
				integrations = {
					-- If enabled, use telescope for menu selection rather than vim.ui.select.
					-- Allows multi-select and some things that vim.ui.select doesn't.
					telescope = nil,
					-- Neogit only provides inline diffs. If you want a more traditional way to look at diffs, you can use `diffview`.
					-- The diffview integration enables the diff popup.
					--
					-- Requires you to have `sindrets/diffview.nvim` installed.
					diffview = true,

					-- If enabled, uses fzf-lua for menu selection. If the telescope integration
					-- is also selected then telescope is used instead
					-- Requires you to have `ibhagwan/fzf-lua` installed.
					fzf_lua = nil,
				},
				sections = {
					-- Reverting/Cherry Picking
					sequencer = {
						folded = false,
						hidden = false,
					},
					untracked = {
						folded = false,
						hidden = false,
					},
					unstaged = {
						folded = false,
						hidden = false,
					},
					staged = {
						folded = false,
						hidden = false,
					},
					stashes = {
						folded = true,
						hidden = false,
					},
					unpulled_upstream = {
						folded = true,
						hidden = false,
					},
					unmerged_upstream = {
						folded = false,
						hidden = false,
					},
					unpulled_pushRemote = {
						folded = true,
						hidden = false,
					},
					unmerged_pushRemote = {
						folded = false,
						hidden = false,
					},
					recent = {
						folded = true,
						hidden = false,
					},
					rebase = {
						folded = true,
						hidden = false,
					},
				},
				mappings = {
					finder = {
						["<cr>"] = "Select",
						["<c-c>"] = "Close",
						["<esc>"] = "Close",
						["<c-n>"] = "Next",
						["<c-p>"] = "Previous",
						["<down>"] = "Next",
						["<up>"] = "Previous",
						["<tab>"] = "MultiselectToggleNext",
						["<s-tab>"] = "MultiselectTogglePrevious",
						["<c-j>"] = "NOP",
					},
					-- Setting any of these to `false` will disable the mapping.
					status = {
						["q"] = "Close",
						["I"] = "InitRepo",
						["1"] = "Depth1",
						["2"] = "Depth2",
						["3"] = "Depth3",
						["4"] = "Depth4",
						["<tab>"] = "Toggle",
						["x"] = "Discard",
						["s"] = "Stage",
						["S"] = "StageUnstaged",
						["<c-s>"] = "StageAll",
						["u"] = "Unstage",
						["U"] = "UnstageStaged",
						["d"] = "DiffAtFile",
						["$"] = "CommandHistory",
						["#"] = "Console",
						["<c-r>"] = "RefreshBuffer",
						["<enter>"] = "GoToFile",
						["<c-v>"] = "VSplitOpen",
						["<c-x>"] = "SplitOpen",
						["<c-t>"] = "TabOpen",
						["?"] = "HelpPopup",
						["D"] = "DiffPopup",
						["p"] = "PullPopup",
						["r"] = "RebasePopup",
						["m"] = "MergePopup",
						["P"] = "PushPopup",
						["c"] = "CommitPopup",
						["l"] = "LogPopup",
						["v"] = "RevertPopup",
						["Z"] = "StashPopup",
						["A"] = "CherryPickPopup",
						["b"] = "BranchPopup",
						["f"] = "FetchPopup",
						["X"] = "ResetPopup",
						["M"] = "RemotePopup",
						["{"] = "GoToPreviousHunkHeader",
						["}"] = "GoToNextHunkHeader",
					},
				},
			})
		end,
	},
	"sindrets/diffview.nvim",
	-- "MTDL9/vim-log-highlighting",
	"AckslD/swenv.nvim",
	{
		"simrat39/rust-tools.nvim",
		config = function()
			vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "rust_analyzer" })

			local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/")
			local codelldb_adapter = {
				type = "server",
				port = "${port}",
				executable = {
					command = mason_path .. "bin/codelldb",
					args = { "--port", "${port}" },
				},
			}

			local opts = {
				tools = { -- rust-tools options

					-- how to execute terminal commands
					-- options right now: termopen / quickfix / toggleterm / vimux
					executor = require("rust-tools.executors").termopen,

					runnables = {
						use_telescope = true,
					},

					-- callback to execute once rust-analyzer is done initializing the workspace
					-- The callback receives one parameter indicating the `health` of the server: "ok" | "warning" | "error"
					on_initialized = function()
						vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter", "CursorHold", "InsertLeave" }, {
							pattern = { "*.rs" },
							callback = function()
								local _, _ = pcall(vim.lsp.codelens.refresh)
							end,
						})
					end,

					-- automatically call RustReloadWorkspace when writing to a Cargo.toml file.
					reload_workspace_from_cargo_toml = true,

					-- These apply to the default RustSetInlayHints command
					inlay_hints = {
						-- automatically set inlay hints (type hints)
						-- default: true
						auto = true,

						-- Only show inlay hints for the current line
						only_current_line = false,

						-- whether to show parameter hints with the inlay hints or not
						-- default: true
						show_parameter_hints = true,

						-- prefix for parameter hints
						-- default: "<-"
						parameter_hints_prefix = "<- ",

						-- prefix for all the other hints (type, chaining)
						-- default: "=>"
						other_hints_prefix = "=> ",

						-- whether to align to the length of the longest line in the file
						max_len_align = false,

						-- padding from the left if max_len_align is true
						max_len_align_padding = 1,

						-- whether to align to the extreme right or not
						right_align = false,

						-- padding from the right if right_align is true
						right_align_padding = 7,

						-- The color of the hints
						highlight = "Comment",
					},

					-- options same as lsp hover / vim.lsp.util.open_floating_preview()
					hover_actions = {

						-- the border that is used for the hover window
						-- see vim.api.nvim_open_win()
						border = {
							{ "╭", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╮", "FloatBorder" },
							{ "│", "FloatBorder" },
							{ "╯", "FloatBorder" },
							{ "─", "FloatBorder" },
							{ "╰", "FloatBorder" },
							{ "│", "FloatBorder" },
						},

						-- Maximal width of the hover window. Nil means no max.
						max_width = nil,

						-- Maximal height of the hover window. Nil means no max.
						max_height = nil,

						-- whether the hover action window gets automatically focused
						-- default: false
						auto_focus = false,
					},

					-- settings for showing the crate graph based on graphviz and the dot
					-- command
					crate_graph = {
						-- Backend used for displaying the graph
						-- see: https://graphviz.org/docs/outputs/
						-- default: x11
						backend = "x11",
						-- where to store the output, nil for no output stored (relative
						-- path from pwd)
						-- default: nil
						output = nil,
						-- true for all crates.io and external crates, false only the local
						-- crates
						-- default: true
						full = true,

						-- List of backends found on: https://graphviz.org/docs/outputs/
						-- Is used for input validation and autocompletion
						-- Last updated: 2021-08-26
						enabled_graphviz_backends = {
							"bmp",
							"cgimage",
							"canon",
							"dot",
							"gv",
							"xdot",
							"xdot1.2",
							"xdot1.4",
							"eps",
							"exr",
							"fig",
							"gd",
							"gd2",
							"gif",
							"gtk",
							"ico",
							"cmap",
							"ismap",
							"imap",
							"cmapx",
							"imap_np",
							"cmapx_np",
							"jpg",
							"jpeg",
							"jpe",
							"jp2",
							"json",
							"json0",
							"dot_json",
							"xdot_json",
							"pdf",
							"pic",
							"pct",
							"pict",
							"plain",
							"plain-ext",
							"png",
							"pov",
							"ps",
							"ps2",
							"psd",
							"sgi",
							"svg",
							"svgz",
							"tga",
							"tiff",
							"tif",
							"tk",
							"vml",
							"vmlz",
							"wbmp",
							"webp",
							"xlib",
							"x11",
						},
					},
				},

				-- all the opts to send to nvim-lspconfig
				-- these override the defaults set by rust-tools.nvim
				-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
				server = {
					-- standalone file support
					-- setting it to false may improve startup time
					standalone = true,
					on_attach = function(client, bufnr)
						require("lvim.lsp").common_on_attach(client, bufnr)
						local rt = require("rust-tools")
						vim.keymap.set("n", "K", rt.hover_actions.hover_actions, { buffer = bufnr })
					end,

					capabilities = require("lvim.lsp").common_capabilities(),
					settings = {
						["rust-analyzer"] = {
							lens = {
								enable = true,
							},
							checkOnSave = {
								enable = true,
								command = "clippy",
							},
						},
					},
				}, -- rust-analyzer options

				-- debugging stuff
				dap = {
					adapter = codelldb_adapter,
				},
			}

			require("rust-tools").setup(opts)

			-- CHANGED --
			lvim.builtin.dap.on_config_done = function(dap)
				dap.adapters.codelldb = codelldb_adapter
				dap.configurations.rust = {
					{
						name = "Launch file",
						type = "codelldb",
						request = "launch",
						program = function()
							return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
						end,
						cwd = "${workspaceFolder}",
						stopOnEntry = false,
					},
				}
			end
		end,
	},
	{
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup({
				show_numbers = true, -- Enable 'number' for the window while peeking
				show_cursorline = true, -- Enable 'cursorline' for the window while peeking
				hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
				number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
				centered_peeking = true, -- Peeked line will be centered relative to window
			})
		end,
	},
	-- "windwp/nvim-spectre",
	{
		"andymass/vim-matchup",
		config = function()
			-- vim.g.matchup_enabled = 0
			vim.g.matchup_matchparen_offscreen = { method = nil }
			vim.g.matchup_matchpref = { html = { nolists = 1 } }
			lvim.builtin.treesitter.matchup.enable = { "astro" }
			lvim.builtin.treesitter.matchup.disable = { "lua" }
			vim.cmd([[
augroup matchup_matchparen_disable_ft
  autocmd!
  autocmd FileType lua let [b:matchup_matchparen_fallback,
      \ b:matchup_matchparen_enabled] = [0, 0]
augroup END
]])
		end,
	},
}
