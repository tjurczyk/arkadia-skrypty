scripts.character.state_reporting = scripts.character.state_reporting or {
    last_index = 1,

    fatigue = {
        options_male = {
            ["0"] = {"'W pelni wypoczety.", "'W pelni sil."},
            ["1"] = {"'Wypoczety."},
            ["2"] = {"'Troche zmeczony."},
            ["3"] = {"'Zmeczony."},
            ["4"] = {"'Bardzo zmeczony."},
            ["5"] = {"'Nieco wyczerpany."},
            ["6"] = {"'Wyczerpany."},
            ["7"] = {"'Bardzo wyczerpany."},
            ["8"] = {"'Wycienczony."},
            ["9"] = {"'Calkowicie wycienczony."},
        },
        options_female = {
            ["0"] = {"'W pelni wypoczeta.", "'W pelni sil."},
            ["1"] = {"'Wypoczeta."},
            ["2"] = {"'Troche zmeczona."},
            ["3"] = {"'Zmeczona."},
            ["4"] = {"'Bardzo zmeczona."},
            ["5"] = {"'Nieco wyczerpana."},
            ["6"] = {"'Wyczerpana"},
            ["7"] = {"'Bardzo wyczerpana."},
            ["8"] = {"'Wycienczona."},
            ["9"] = {"'Calkowicie wycienczona."},
        }
    },
 
    encumbrance = {
        options_male = {
            ["0"] = {"'Brak obciazenia"},
            ["1"] = {"'Wadzi mi troche."},
            ["2"] = {"'Daje mi sie we znaki."},
            ["3"] = {"'Ekwipunek jest dosc klopotliwy."},
            ["4"] = {"'Ekwipunek jest wyjatkowo ciezki."},
            ["5"] = {"'Ekwipunek jest niemilosiernie ciezki"},
            ["6"] = {"'Ekwipunek przygniata mnie do ziemi."},
        },
        options_female = {
            ["0"] = {"'Brak obciazenia"},
            ["1"] = {"'Wadzi mi troche."},
            ["2"] = {"'Daje mi sie we znaki."},
            ["3"] = {"'Ekwipunek jest dosc klopotliwy."},
            ["4"] = {"'Ekwipunek jest wyjatkowo ciezki."},
            ["5"] = {"'Ekwipunek jest niemilosiernie ciezki"},
            ["6"] = {"'Ekwipunek przygniata mnie do ziemi."},
        }
    },

    stuffed = {
        options_male = {
            ["0"] = {"'Bardzo glodny"},
            ["1"] = {"'Glodny."},
            ["2"] = {"'Najedzony."},
            ["3"] = {"'Bardzo najedzony."},
        },
        options_female = {
            ["0"] = {"'Bardzo glodna"},
            ["1"] = {"'Glodna."},
            ["2"] = {"'Najedzona."},
            ["3"] = {"'Bardzo najedzona."},
        }
    },

    soaked = {
        options_male = {
            ["0"] = {"'Bardzo chce mi sie pic", "'Bardzo spragniony"},
            ["1"] = {"'Chce mi sie pic.", "'Spragniony"},
            ["2"] = {"'Troche chce mi sie pic.", "'Troche spragniony"},
            ["3"] = {"'Nie chce mi sie pic."},
        },
        options_female = {
            ["0"] = {"'Bardzo chce mi sie pic", "'Bardzo spragniona"},
            ["1"] = {"'Chce mi sie pic.", "'Spragniona"},
            ["2"] = {"'Troche chce mi sie pic.", "'Troche spragniona"},
            ["3"] = {"'Nie chce mi sie pic."},
        }
    },

    intox = {
        options_male = {
            ["0"] = {"'Trzezwy"},
            ["1"] = {"'Pochmielony."},
            ["2"] = {"'Lekko podpity."},
            ["3"] = {"'Podpity."},
            ["4"] = {"'Wstawiony."},
            ["5"] = {"'Mocno wstawiony."},
            ["6"] = {"'Pijany."},
            ["7"] = {"'Schlany."},
            ["8"] = {"'Napruty."},
            ["9"] = {"'Nawalony."},
            ["10"] = {"'Pijany jak bela."},
        },
        options_female = {
            ["0"] = {"'Trzezwa"},
            ["1"] = {"'Pochmielona."},
            ["2"] = {"'Lekko podpita."},
            ["3"] = {"'Podpita."},
            ["4"] = {"'Wstawiona."},
            ["5"] = {"'Mocno wstawiona."},
            ["6"] = {"'Pijana."},
            ["7"] = {"'Schlana."},
            ["8"] = {"'Napruta."},
            ["9"] = {"'Nawalona."},
            ["10"] = {"'Pijana jak bela."},
        }
    },

    mana = {
        options_male = {
            ["0"] = {"'Jestem u kresu sil mentalnych"},
            ["1"] = {"'Jestem wykonczony mentalnie."},
            ["2"] = {"'Jestem wyczerpana mentalnie."},
            ["3"] = {"'Jestem w zlej kondycji mentalnej."},
            ["4"] = {"'Jestem bardzo zmeczony mentalnie."},
            ["5"] = {"'Jestem zmeczony mentalnie."},
            ["6"] = {"'Jestem oslabiony mentalnie."},
            ["7"] = {"'Jestem lekko oslabony mentalnie."},
            ["8"] = {"'Jestem w pelni sil mentalnych."},
        },
        options_female = {
            ["0"] = {"'Jestem u kresu sil mentalnych"},
            ["1"] = {"'Jestem wykonczona mentalnie."},
            ["2"] = {"'Jestem wyczerpana mentalnie."},
            ["3"] = {"'Jestem w zlej kondycji mentalnej."},
            ["4"] = {"'Jestem bardzo zmeczona mentalnie."},
            ["5"] = {"'Jestem zmeczona mentalnie."},
            ["6"] = {"'Jestem oslabiona mentalnie."},
            ["7"] = {"'Jestem lekko oslabona mentalnie."},
            ["8"] = {"'Jestem w pelni sil mentalnych."},
        }
    },
}

function scripts.character.state_reporting.say_state(property)

    local config = scripts.character.state_reporting[property];
    if not config then 
        debugc("Brak opcji scripts.character.state_reporting." .. property)
        return
    end

    local command;
    if gmcp.char.state[property] and gmcp.char.info.gender then
        local options = config['options_'..gmcp.char.info.gender];
        local value = gmcp.char.state[property]
        local labels = options["" .. value]

        if #labels == 0 then
            debugc("Brak etykiet dla wartosci " .. property.. "=" .. value)
            command = nil
        else 
            local index = scripts.character.state_reporting.last_index;
            index = (index - 1) % #labels + 1
            command = labels[index];
            scripts.character.state_reporting.last_index = index + 1;
        end
    end

    if command then
        send(command, false)
    end
end


function alias_func_skrypty_character_state_reporting_mana()
    scripts.character.state_reporting.say_state("mana")
end

function alias_func_skrypty_character_state_reporting_intox()
    scripts.character.state_reporting.say_state("intox")
end

function alias_func_skrypty_character_state_reporting_fatigue()
    scripts.character.state_reporting.say_state("fatigue")
end

function alias_func_skrypty_character_state_reporting_stuffed()
    scripts.character.state_reporting.say_state("stuffed")
end

function alias_func_skrypty_character_state_reporting_soaked()
    scripts.character.state_reporting.say_state("soaked")
end

function alias_func_skrypty_character_state_reporting_encumbrance()
    scripts.character.state_reporting.say_state("encumbrance")
end

    