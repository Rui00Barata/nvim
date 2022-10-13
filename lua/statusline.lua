local M = {}

function M.setup()
	local function status_line()
		local mode = "%-5{%v:lua.string.upper(v:lua.vim.fn.mode())%}"
		local file_name = "%-.16t"
		local buf_nr = "[%n]"
		local modified = " %-m"
		local file_type = " %y"
		local right_align = "%="
		local line_no = "%10([%l/%L%)]"
		local coll = "%3(%v%)"
		local pct_thru_file = "%7p%%"

		return string.format(
			"%s%s%s%s%s%s%s%s%s",
			mode,
			file_name,
			buf_nr,
			modified,
			file_type,
			right_align,
			line_no,
			coll,
			pct_thru_file
		)
	end

	vim.opt.statusline = status_line()
	vim.opt.laststatus = 3
end

return M
