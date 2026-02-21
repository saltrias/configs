local M = {}

M.palette = {
	rosewater = "#F5E0DC",
	flamingo = "#F2CDCD",
	pink = "#F5C2E7",
	mauve = "#CBA6F7",
	red = "#F38BA8",
	maroon = "#EBA0AC",
	peach = "#FAB387",
	yellow = "#F9E2AF",
	green = "#A6E3A1",
	teal = "#94E2D5",
	sky = "#89DCEB",
	sapphire = "#74C7EC",
	blue = "#89B4FA",
	lavender = "#B4BEFE",
	text = "#CDD6F4",
	subtext1 = "#BAC2DE",
	subtext0 = "#A6ADC8",
	overlay2 = "#9399B2",
	overlay1 = "#7F849C",
	overlay0 = "#6C7086",
	surface2 = "#585B70",
	surface1 = "#45475A",
	surface0 = "#313244",
	base = "#1E1E2E",
	mantle = "#181825",
	crust = "#11111B",
}

M.colorPaletteList = {
    M.palette.red,
    M.palette.peach,
    M.palette.yellow,
    M.palette.green,
    M.palette.blue,
    M.palette.mauve,
}


function M.lualineAutoPalette(colorPalette, colorOffset, colorStep)
    local colorOffset = colorOffset or 0
    local colorStep = colorStep or 1

    local config = {}
    local modes = { "normal", "insert", "visual", "replace", "command" } 
    local n = #colorPalette
    local textColor = "#181825"
    local textColorOnDark = "#CDD6F4"

    for i, mode in ipairs(modes) do
        local a = { bg = colorPalette[((colorOffset + (i - 1) * colorStep) % n) + 1], fg = textColor, gui="bold" }
        local b = { bg = colorPalette[((colorOffset + (i - 0) * colorStep) % n) + 1], fg = textColor }
        local c = { bg = textColor, fg = textColorOnDark }
        local x = { bg = textColor, fg = textColorOnDark }
        local y = { bg = colorPalette[((colorOffset + (i + 1) * colorStep) % n) + 1], fg = textColor }
        local z = { bg = colorPalette[((colorOffset + (i + 2) * colorStep) % n) + 1], fg = textColor }

        local modeConfig = {a=a, b=b, c=c, x=x, y=y, z=z}
        config[mode] = modeConfig
    end
    return config
end

return M
