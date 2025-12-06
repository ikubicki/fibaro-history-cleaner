--[[
History cleaner
@author ikubicki
@version 1.1.0
]]


function QuickApp:onInit()
    self.i18n = i18n:new(api.get("/settings/info").defaultLanguage)
    self:updateView("label", "text", self.i18n:get("name"))
    self:updateView("button1", "text", self.i18n:get("clear"))
end

function QuickApp:button1Event()
    local clearHistoryCallback = function()
        self:updateView("label", "text", string.format(self.i18n:get("last-update"), os.date('%Y-%m-%d %H:%M:%S')))
        self:updateView("button1", "text", self.i18n:get("clear"))
    end
    local clearDebugMessagesCallback = function()
        self:clearHistory(clearHistoryCallback)
    end
    self:clearDebugMessages(clearDebugMessagesCallback)
end

function QuickApp:clearHistory(callback)
    self:updateView("button1", "text", self.i18n:get("clearing history"))
    api.delete("/events/history?timestamp=2000000000")
    QuickApp:trace(self.i18n:get("Device history cleared"))
    if callback then
        callback()
    end
end

function QuickApp:clearDebugMessages(callback)
    self:updateView("button1", "text", self.i18n:get("clearing console"))
    api.delete("/debugMessages")
    QuickApp:trace(self.i18n:get("Console logs cleared"))
    if callback then
        callback()
    end
end