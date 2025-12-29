--[[
History cleaner
@author ikubicki
@version 2.0.0
]]

QuickApp.logLevel = 9

local function split(str, sep)
    sep = sep or ","
    local t = {}
    for field in (str .. sep):gmatch("(.-)" .. sep) do
        field = field:match("^%s*(.-)%s*$")
        table.insert(t, field)
    end
    return t
end

function QuickApp:onInit()
    self.i18n = i18n:new(api.get("/settings/info").defaultLanguage)
    self:updateView("label", "text", self.i18n:get("name"))
    self:updateView("button1", "text", self.i18n:get("clear"))
    self:updateView('collectionsSelected', "label", self.i18n:get("select-collections"))
    local collections = self:getVariable("collections")
    if collections == "" then
        collections = "console,history"
        self:setVariable("collections", collections)
    end
    local offset = self:getVariable("offset")
    if offset == "" then 
        offset = "0"
        self:setVariable("offset", offset)
    end
    self:updateView("collectionsSelected", "selectedItems", split(collections))

    self:updateView("label_offsetValue", "text", self.i18n:get("select-offset"))
    self:updateView("offsetValue", "min", "0")
    self:updateView("offsetValue", "max", "30")
    self:updateView("offsetValue", "value", offset)
    QuickApp:trace(self.i18n:get("name") .. " v 2.0.0")
end

function QuickApp:onManualClear()
    local clearHistoryCallback = function()
        self:updateView("label", "text", string.format(self.i18n:get("last-update"), os.date('%Y-%m-%d %H:%M:%S')))
        self:updateView("button1", "text", self.i18n:get("clear"))
    end
    local clearDebugMessagesCallback = function()
        self:clearHistory(clearHistoryCallback)
    end
    self:clearDebugMessages(clearDebugMessagesCallback)
end

function QuickApp:onCollectionSelection(e)
    local value = table.concat(e.values[1], ",")
    if value == "" then value = "none" end
    self:setVariable("collections", value)
    self:updateView("collectionsSelected", "selectedItems", split(value))
end

function QuickApp:onOffsetSelection(e)
    self:setVariable("offset", tostring(e.values[1]))
    self:updateView('offsetValue', "value", tostring(e.values[1]))
end

function QuickApp:clearHistory(callback)
    if not string.find(self:getVariable('collections'), "history", 1, true) then
        -- QuickApp:debug("Skipping device history")
        if callback then
            callback()
        end
        return
    end
    local timestamp = math.floor(os.time() - (self:getVariable('offset') * 86400))
    self:updateView("button1", "text", self.i18n:get("clearing history"))
    -- QuickApp:debug("/events/history?timestamp=" .. timestamp)
    api.delete("/events/history?timestamp=" .. timestamp)
    QuickApp:trace(self.i18n:get("Device history cleared"))
    if callback then
        callback()
    end
end

function QuickApp:clearDebugMessages(callback)
    if not string.find(self:getVariable('collections'), "console", 1, true) then
        -- QuickApp:debug("Skipping console logs")
        if callback then
            callback()
        end
        return
    end
    self:updateView("button1", "text", self.i18n:get("clearing console"))
    -- QuickApp:debug("/debugMessages")
    api.delete("/debugMessages")
    QuickApp:trace(self.i18n:get("Console logs cleared"))
    if callback then
        callback()
    end
end
