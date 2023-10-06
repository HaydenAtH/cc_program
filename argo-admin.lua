local argoAdminService = {}

function argoAdminService.addLog(content)
    local logs = fs.open("adminLogs", "a")
    logs.write("\n" .. os.date("%d/%m/%Y %H:%M:%S") .. " - " .. content)
    logs.close()
end

function argoAdminService.getLogs()
    local logs = fs.open("adminLogs", "r")
    local contents = logs.readAll()
    
    logs.close()
    return contents
end

return argoAdminService;