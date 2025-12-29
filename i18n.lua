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
        ['collection-history'] = 'Historia urządzeń',
        ['collection-console'] = 'Konsola',
        ['select-collections'] = 'Wybierz kolekcje do wyczyszczenia',
        ['select-offset'] = 'Wybierz ilość dni do pozostawienia (historia urządzeń)',
    },
    en = {
        ['name'] = 'History cleaner',
        ['clear'] = 'Clear history',
        ['clearing history'] = 'Clearing history...',
        ['clearing console'] = 'Clearing console...',
        ['Device history cleared'] = 'Device history cleared',
        ['Console logs cleared'] = 'Console logs cleared',
        ['last-update'] = 'Last attempt: %s',
        ['collection-history'] = 'Device history',
        ['collection-console'] = 'Console logs',
        ['select-collections'] = 'Select logs collections to clear',
        ['select-offset'] = 'Select number of days to keep (device history)',
    },
    de = {
        ['name'] = 'Verlaufsreiniger',
        ['clear'] = 'Verlauf löschen',
        ['clearing history'] = 'Verlauf wird gelöscht...',
        ['clearing console'] = 'Konsole wird geleert...',
        ['Device history cleared'] = 'Gerätehistorie gelöscht',
        ['Console logs cleared'] = 'Konsole gelöscht',
        ['last-update'] = 'Letzter Versuch: %s',
        ['collection-history'] = 'Gerätehistorie',
        ['collection-console'] = 'Konsole',
        ['select-collections'] = 'Wählen Sie die zu löschenden Log-Sammlungen aus',
        ['select-offset'] = 'Anzahl der Tage auswählen (Gerätehistorie)',
    }
}
