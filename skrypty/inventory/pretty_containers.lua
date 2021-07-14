scripts.inv.pretty_containers = scripts.inv.pretty_containers or {}

local function create_pattern(tab, endline)
    local start_line_patterns = table.deepcopy(tab)
    for k,v in pairs(start_line_patterns or {}) do
        start_line_patterns[k] = "(^|\\s)" .. v
        if endline then
            start_line_patterns[k] = start_line_patterns[k] .. "\\S*$"
        end
    end
    return "(" .. table.concat(start_line_patterns, "|") .. ")"
end

function scripts.inv.pretty_containers:create_regexp_filter(tab, endline)
    return function(item)
        return rex.find(item.name, create_pattern(tab, endline))
    end
end

local function magics_filter(item)
    return table.contains(scripts.inv.magics_data.magics, item.name)
end

local function keys_filter(item)
    return table.contains(scripts.inv.magic_keys_data.magic_keys, item.name)
end

local weapons = { "darda", "dardy", "multon", "kord", "puginal", "gladius", "topor", "berdysz", "siekier", "czekan", "oskard", "kilof", "tasak", "tabar", "nadziak", "miecz", "sihill", "drannach", "szabl", "szabel", "rapier", "scimitar", "katzbalger", "stilett", "pal", "sztylet", "halabard", "falchion", "mlot", "obusz", "wloczni", "pik[ei]", "noz", "maczug", "morgenstern", "kordelas", "mizerykordi", "buzdygan", "korbacz", "gal[ae]z(?!k) ", "bulaw", "drag", "kiscien", "nog[ai] stolow", "dag[ai]", "wloczni[aei]", "floret", "wekier", "walek", "kostur", "kos[aye]", "szponton", "partyzan", "glewi", "gizarm", "dzid", "naginat", "rohatyn", "korsek", "cep", "trojz[ea]b", "ronkon", "runk", "flamberg", "poltorak", "bulat", "nimsz", "szamszir", "lami", "schiavon", "lewak", "sierp", "lask", "wid[el]", "saif", "koncerz", "kij", "espadon", "claymor", "cinquend", "szpad", "karabel", "jatagan", "baselard", "katar", "bastard", "kafar", "kindzal", "harpun", "kotwic", "kadzielnic", "lancet", "ostrz", "berl", "chepesz", "spis( |$|y|e|a)", "talwar", "dluto", "pejcz", "kanczug", "parazonium", "lancuch", "kropacz", "piernacz", "estok" }
local shields = { "tarcz", "puklerz", "pawez", "luskow. pancern. skorup. zolwia" }
local torso = { "brygantyn", "napiersnik", "kirys", "kolczug", "karacen", "kaftan", "tunik", "zbroj", "bajdan[ay]", "anim[eay]", "kozus", "kurt", "kamizel", "becht", "pancerz", "zbro. plytow", "polpancerz", "nabrzusznik", "bajdan" }
local head = { "helm", "burgonet", "misiurk", "kaptur", "morion", "basinet", "salad", "przylbic", "diadem", "szyszak", "narbut[ay]", "armet", "casquett", "czapk", "beret", "turban", "gigantyczn. wzmacnian. czaszk", "barbut", "kapalin", "koron", "klobuk" }
local legs = { "nagolennik", "spoden", "nogawic", "buty", "butow", "trzewik", "spodni", "spodnic", "naudziak", "sandal", "nakolannik", "nabiodr" }
local hands = { "nareczak", "naramiennik", "rekawic", "karwasz" }
local wear = { "futro", "kubraczek", "koszul", "sukni", "sukien", "plaszcz", "peleryn", "tog", "szat", "bloniaste skrzydl", "chust", "pas( |$|y)", "gemm", "obroz", "szat", "kolnierz", "dublet", "kapelusz", "przepask", "wams", "oficer[ek]", "bigwant", "calun", "kapuz" }
local jewelery = { "pierscien(?!iowa)", "naszyjnik", "bransolet", "spink", "talizman", "amulet", "kolczyk", "lancuszki", "koral", "wisior", "medalion", "lancusz", "brosz", "szarf", "koli[iae]", "sygnet", "obracze?k", "potrojn. sznur.*", "cwiek( |$|i|ow)(?!ana)" }
local gems = { "obsydia(ny|now|n)", "labrado(ry|row|r)", "oliwi(ny|now|n)", "gaga(ty|tow|t)", "fluory(ty|tow|t)", "burszty(ny|now|n)", "ametys(ty|tow|t)", "kwar(ce|cow|c)", "rubi(ny|now|n)", "piry(ty|tow|t)", "serpenty(ny|now|n)", "per(ly|le|la|el)", "serpenty(ny|now|n)", "malachi(ty|tow|t)", "karneo(le|low|l)", "lazury(ty|tow|t)", "nefry(ty|tow|t)", "aleksandry(ty|tow|t)", "celesty(ny|now|n)", "monacy(ty|tow|t)", "azury(ty|tow|t)", "jaspi(sy|sow|s)", "onyk(sy|sow|s)", "turmali(ny|now|n)", "awentury(ny|now|n)", "turku(sy|sow|s)", "opa(li|le|l)", "kryszta(ly|low|l)", "hematy(ty|tow|t)", "rodoli(ty|tow|t)", "aga(ty|tow|t)", "jaskrawozolt.* cytry(ny|now|n(?!e))", "apaty(ty|tow|t)", "kyani(ty|tow|t)", "akwamary(ny|now|n)", "ioli(ty|tow|t)", "diopsy(dy|dow|d)", "cyrko(ny|now|n)", "zoisy(ty|tow|t)", "grana(ty|tow|t)", "almandy(ny|now|n)", "ortokla(zy|zow|z)", "topa(zy|zow|z)", "tytani(ty|tow|t)", "diamen(ty|tow|t)", "szafi(ry|row|r)", "szmaragd", "chryzoberyl", "spinel", "chryzopraz", "rodochrozyt", "heliodor"}

scripts.inv.pretty_containers.fixed_groups = {
    ["sklerotyzowan.* mlecznoszar.* tarcz.*"] = "inne",
    ["nakrapian.* chitynow.* pancerz.*"] = "inne"
}

scripts.inv.pretty_containers.group_definitions = {
    { name = "bronie", filter = scripts.inv.pretty_containers:create_regexp_filter(weapons) },
    { name = "korpus", filter = scripts.inv.pretty_containers:create_regexp_filter(torso) },
    { name = "tarcze", filter = scripts.inv.pretty_containers:create_regexp_filter(shields) },
    { name = "glowa", filter = scripts.inv.pretty_containers:create_regexp_filter(head) },
    { name = "rece", filter = scripts.inv.pretty_containers:create_regexp_filter(hands) },
    { name = "nogi", filter = scripts.inv.pretty_containers:create_regexp_filter(legs) },
    { name = "ubrania", filter = scripts.inv.pretty_containers:create_regexp_filter(wear) },
    { name = "bizuteria", filter = scripts.inv.pretty_containers:create_regexp_filter(jewelery) },
    { name = "kamienie", filter = scripts.inv.pretty_containers:create_regexp_filter(gems, true) },
    { name = "klucze", filter = keys_filter}
}

local preferred_magics = function(name)
    local key, properties = scripts.inv:find_magic(name)
    local preferred_types = scripts.inv.containers.preferred_magic_types
    local additional_magics = scripts.inv.containers.preferred_magics
    return key and (not table.is_empty(table.n_intersection(properties.type, preferred_types)) or table.contains(additional_magics, key))
end

scripts.inv.pretty_containers.name_transformers = {
    ["magic"] = {check = function(name) return table.contains(scripts.inv.magics_data.magics, string.lower(name)) end, transform = function(name) return "<" .. scripts.inv.magics_color .. ">" .. name end},
    ["preferred_magic"] = {check = preferred_magics, transform = function(name) return string.format("<spring_green>***<reset> <%s>%s <spring_green>***", scripts.inv.magics_color, name) end},
    ["keys"] = {check = function(name) return table.contains(scripts.inv.magic_keys_data.magic_keys, string.lower(name)) end, transform = function(name) return "<" .. scripts.inv.magic_keys_color .. ">" .. name end},
    ["mithryl"] = {check = function(name) return rex.find(name, "mithryl\\w* monet") end, transform = AutomaticTable.color_transformer("pale_turquoise")},
    ["gold"] = {check = function(name) return rex.find(name, "zlot\\w* monet") end, transform = AutomaticTable.color_transformer("gold")},
    ["silver"] = {check = function(name) return rex.find(name, "srebrn\\w* monet") end, transform = AutomaticTable.color_transformer("white")},
    ["copper"] = {check = function(name) return rex.find(name, "miedzian\\w* monet") end, transform = AutomaticTable.color_transformer("SaddleBrown")},
}

local count_name_transformer = function(item)
    local count_prefix = scripts.utils.str_pad(tostring(item.amount), 4, "right") .. " | "
    local name = item.name
    for key, properties in pairs(scripts.inv.pretty_containers.name_transformers) do
        if properties.check(item.name) then
            name = properties.transform(name)
        end
    end

    return string.format("%s%s<reset>", count_prefix, name,  "<reset>")
end

function scripts.inv.pretty_containers:print(content, columns_count, filter)
    local container_elements = scripts.utils:extract_string_list(content)
    if filter then
        container_elements = filter(container_elements)
    end

    local result = {}
    for _, group in ipairs(scripts.inv.pretty_containers.group_definitions) do
            result[group.name] = result[group.name] or {}
    end
    result["inne"] = {}

    for key, element in pairs(container_elements) do
        local in_fixed_group = false
        for pattern, fixed_group in pairs(self.fixed_groups) do
            if rex.find(element.name, pattern) then
                table.insert(result[fixed_group], count_name_transformer(element))
                in_fixed_group = true
            end
        end
        if not in_fixed_group then
            local added
            for _, group in ipairs(scripts.inv.pretty_containers.group_definitions) do
                added = false
                if group.filter(element) then
                    table.insert(result[group.name], count_name_transformer(element))
                    added = true
                    break
                end
            end
            if not added then
                table.insert(result["inne"], count_name_transformer(element))
            end
        end
    end

    local not_empty_result = {}
    for k,v in pairs(scripts.inv.pretty_containers.group_definitions) do
        if result[v.name] and not table.is_empty(result[v.name]) then
            table.insert(not_empty_result, {name = v.name, values = result[v.name]})
        end
    end
    table.insert(not_empty_result, {name = "inne", values = result["inne"]})

    local content_table = AutomaticTable:new(false)
    content_table:set_title("P O J E M N I K")
    for i = 1, table.size(not_empty_result), columns_count do
        local current_columns = {}
        for j = 0, columns_count - 1 do
            if not_empty_result[i + j] then
                table.insert(current_columns, not_empty_result[i + j].name)
            else
                table.insert(current_columns, "")
            end
        end
        if not table.is_empty(current_columns) then
            content_table:add_row(table.deepcopy(current_columns), AutomaticTable.color_transformer("slate_blue"))
            local contents = {}
            for _, name in pairs(current_columns) do
                table.insert(contents, result[name] or {})
            end
            content_table:add_row(contents)
        end
    end
    content_table:print()
end
