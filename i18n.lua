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
        ['clearing history'] = 'Czyszczę historię...',
        ['clearing console'] = 'Czyszczę logi konsoli...',
        ['Device history cleared'] = 'Historia urządzeń wyczyszczona',
        ['Console logs cleared'] = 'Konsola wyczyszczona',
        ['last-update'] = 'Ostatnia próba: %s',
    },
    en = {
        ['name'] = 'History cleaner',
        ['clear'] = 'Clear history',
        ['clearing history'] = 'Clearing history...',
        ['clearing console'] = 'Clearing console...',
        ['Device history cleared'] = 'Device history cleared',
        ['Console logs cleared'] = 'Console logs cleared',
        ['last-update'] = 'Last attempt: %s',
    },
    de = {
        ['name'] = 'Verlaufsreiniger',
        ['clear'] = 'Verlauf löschen',
        ['clearing history'] = 'Verlauf wird gelöscht...',
        ['clearing console'] = 'Konsole wird geleert...',
        ['Device history cleared'] = 'Gerätehistorie gelöscht',
        ['Console logs cleared'] = 'Konsole gelöscht',
        ['last-update'] = 'Letzter Versuch: %s',
    }
}