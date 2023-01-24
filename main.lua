--[[
Fibaro History cleaner
@author ikubicki
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
    self:clearHistory(clearHistoryCallback)
end

function QuickApp:clearHistory(callback)
    self:updateView("button1", "text", self.i18n:get("clearing"))
    api.delete("/events/history?timestamp=2000000000")
    if callback then
        callback()
    end
end