local argoInputService = {}

--!  Run in parallel function
function mouseHandler()
    while true do
        local event, button, x, y = os.pullEvent("mouse_click")
        print(("The mouse button %s was pressed at %d, %d"):format(button, x, y))
      end
end

return argoInputService;