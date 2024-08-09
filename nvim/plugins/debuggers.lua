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

local debug_conf_path = vim.fn.getenv("VIRTUAL_ENV") .. "/" .. "dap_conf.lua"
if (vim.loop.fs_stat(debug_conf_path) ~= nil) then
	local debug_conf = dofile(debug_conf_path)

	local python_config = {
		{
			type = "python",
			request = "launch",
			name = "Launch file",
			program = "${file}",
			pythonPath = function()
				-- Use the Python executable of the venv
				local venv_path = vim.fn.getenv("VIRTUAL_ENV")

				-- Handle the case where venv_path is nil or vim.NIL, i.e. not within a venv
				if venv_path and venv_path ~= vim.NIL then
					-- Support Windows as well
					local python_executable = "/bin/python"
					if vim.fn.has("win32") == 1 then
						python_executable = "\\Scripts\\python.exe"
					end

					return venv_path .. python_executable
				else
					-- Fallback to default Python interpreter if no venv is made
					return "python"
				end
			end,
		}
	}

	for key, value in pairs(debug_conf) do
		python_config[1][key] = value
	end

	dap.configurations.python = python_config
end

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
