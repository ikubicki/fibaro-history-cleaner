--[[
Internationalization tool
@author ikubicki
]]
class 'i18n'

function i18n:new(langCode)
    if phrases[langCode] == nil then
        langCode = 'en'
    end
    self.phrases = phrases[langCode]
    return self
end

function i18n:get(key)
    if self.phrases[key] then
        return self.phrases[key]
    end
    return key
end

phrases = {
    pl = {
        ['name'] = 'Czyściciel historii',
        ['clear'] = 'Wyczyść historię',
        ['clearing'] = 'Czyszczę historię...',
        ['last-update'] = 'Ostatnia próba: %s',
    },
    en = {
        ['name'] = 'History cleaner',
        ['clear'] = 'Clear history',
        ['clearing'] = 'Clearing history...',
        ['last-update'] = 'Last attempt: %s',
    },
    de = {
        ['name'] = 'Verlaufsreiniger',
        ['clear'] = 'Verlauf löschen',
        ['clearing'] = 'Verlauf löschen...',
        ['last-update'] = 'Letzter Versuch: %s',
    }
}