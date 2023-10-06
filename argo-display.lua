local displayService = {}

local activeDisplays = {} -- {window: {x, y, width, height, cursorPos}}

function displayService.createWindow(x, y, width, height)
    local window = window.create(term.current(), x, y, width, height)
    window.clear()
    window.setTextColor(colors.orange)

    activeDisplays[window] = {x = x, y = y, width = width, height = height, cursorPos = {x = 1, y = 1}}
    return window
end

function displayService.logln(window, content)
    window.setCursorPos(activeDisplays[window]["cursorPos"]["x"], activeDisplays[window]["cursorPos"]["y"])

    window.write(content)

    activeDisplays[window]["cursorPos"]["x"] = 1
    activeDisplays[window]["cursorPos"]["y"] = activeDisplays[window]["cursorPos"]["y"] + 1
    window.setCursorPos(activeDisplays[window]["cursorPos"]["x"], activeDisplays[window]["cursorPos"]["y"])
    window.redraw()
    
end

function displayService.log(window, content)
    window.setCursorPos(activeDisplays[window]["cursorPos"]["x"] + 1, activeDisplays[window]["cursorPos"]["y"])
    window.write(content)
    activeDisplays[window]["cursorPos"]["x"] = activeDisplays[window]["cursorPos"]["x"] + string.len(content)

    window.setCursorPos(activeDisplays[window]["cursorPos"]["x"], activeDisplays[window]["cursorPos"]["y"])
end

function displayService.refreshWindows()
    for window, windowData in pairs(activeDisplays) do
        window.redraw()
    end
end

return displayService
