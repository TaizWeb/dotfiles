local dap = require("dap")
local dapui = require("dapui")
local dap_virtual_text = require("nvim-dap-virtual-text")
local mason_registry = require("mason-registry")

-- Setup nvim-dap-ui
dapui.setup()

-- Setup nvim-dap-virtual-text
dap_virtual_text.setup()

local function get_debugpy_path()
	local package = mason_registry.get_package("debugpy")
	local install_path = package:get_install_path()
	return install_path .. "/venv/bin/python"
end

-- Python adapter configuration, this captures Mason's path to it's debugpy install
dap.adapters.python = {
	type = "executable",
	command = get_debugpy_path(),
	args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
		pythonPath = function()
			-- Use the Python executable of the virtual environment.
			local venv_path = vim.fn.getenv("VIRTUAL_ENV")
			if venv_path then
				return venv_path .. "/bin/python"
			else
				return "python"
			end
		end,
	},
}

-- Automatically open/close dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
