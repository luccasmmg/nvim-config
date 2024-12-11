local status_ok, copilot_chat = pcall(require, "CopilotChat")
if not status_ok then
	return
end

copilot_chat.setup({
	{
		debug = false, -- Enable debug logging
		proxy = nil, -- [protocol://]host[:port] Use this proxy
		allow_insecure = false, -- Allow insecure server connections

		model = "gpt-4", -- GPT model to use, 'gpt-3.5-turbo' or 'gpt-4'
		temperature = 0.1, -- GPT temperature

		name = "CopilotChat", -- Name to use in chat
		separator = "---", -- Separator to use in chat
		show_folds = true, -- Shows folds for sections in chat
		show_help = true, -- Shows help message as virtual lines when waiting for user input
		auto_follow_cursor = true, -- Auto-follow cursor in chat
		clear_chat_on_new_prompt = false, -- Clears chat on every new prompt

		context = nil, -- Default context to use, 'buffers', 'buffer' or none (can be specified manually in prompt via @).
		history_path = vim.fn.stdpath("data") .. "/copilotchat_history", -- Default path to stored history
		callback = nil, -- Callback to use when ask response is received

		-- default selection (visual or line)
		selection = function(source)
			return select.visual(source) or select.line(source)
		end,

	-- default window options
		window = {
			layout = "vertical", -- 'vertical', 'horizontal', 'float'
			-- Options below only apply to floating windows
			relative = "editor", -- 'editor', 'win', 'cursor', 'mouse'
			border = "single", -- 'none', single', 'double', 'rounded', 'solid', 'shadow'
			width = 0.8, -- fractional width of parent
			height = 0.6, -- fractional height of parent
			row = nil, -- row position of the window, default is centered
			col = nil, -- column position of the window, default is centered
			title = "Copilot Chat", -- title of chat window
			footer = nil, -- footer of chat window
			zindex = 1, -- determines if window is on top or below other floating windows
		},

		-- default mappings
		mappings = {
			close = "q",
			reset = "<C-l>",
			complete = "<Tab>",
			submit_prompt = "<CR>",
			accept_diff = "<C-y>",
			show_diff = "gd",
			show_system_prompt = "gp",
			show_user_selection = "gs",
		},
	},
})
