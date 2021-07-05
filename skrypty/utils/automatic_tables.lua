AutomaticTable = AutomaticTable or {}

function AutomaticTable.color_transformer(color)
    return function(item)
        return "<" .. color .. ">" .. item .. "<reset>"
    end
end

function AutomaticTable:new(even_columns, skip_separators, center_columns)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.headers = {}
    o.data = {}
    o.columns = {}
    o.title = false
    o.padding = 5
    o.even_columns = even_columns
    o.skip_separators = skip_separators
    o.center_columns = center_columns
    return o
end

function AutomaticTable:set_title(title)
    self.title = title
end

function AutomaticTable:set_headers(headers, center)
    self.headers = headers
    self.center_headers = center
    self:check_columns(headers)
end

function AutomaticTable:add_row(elements, transform)
    for k, v in pairs(elements) do
        if type(v) ~= "table" then
            elements[k] = { v }
        end

        for key, el in pairs(elements[k]) do
            local split = string.split(el, "\n")
            if (not table.is_empty(split)) then
                elements[k][key] = split
            end
        end
        elements[k] = table.n_flatten(elements[k])

        if type(transform) == "function" then
            for key, el in pairs(elements[k]) do
                elements[k][key] = transform(el)
            end
        end
    end
    self:check_columns(elements)
    table.insert(self.data, elements)
end

function AutomaticTable:check_columns(elements)
    for index, value in ipairs(elements) do
        if type(value) == "table" then
            if table.is_empty(value) then
                self.columns[index] = self.columns[index] or 0
            end
            for _, inner_value in pairs(value) do
                self.columns[index] = math.max(self.columns[index] or 0, scripts.utils.real_len(inner_value))
            end
        else
            self.columns[index] = math.max(self.columns[index] or 0, scripts.utils.real_len(value))
        end
    end
end

function AutomaticTable:print()
    if self.even_columns then
        local max_column = 0
        for _, len in pairs(self.columns) do
            max_column = math.max(max_column, len)
        end
        for index, _ in ipairs(self.columns) do
            self.columns[index] = max_column
        end
    end
    self.width = 1
    for index, width in pairs(self.columns) do
        self.width = self.width + width + self.padding * 2 + 1
    end
    if self.title then
        self.width = math.max(self.width, scripts.utils.real_len(self.title) + self.padding * 2 + 1)
    end
    echo("\n")
    self:print_title()
    self:print_header()
    self:print_data()
    self:print_border()
end

function AutomaticTable:print_title()
    if self.title then
        self:print_border(true)
        cecho("|")
        cecho(scripts.utils.str_pad(self.title, self.width - 2, "center"))
        cecho("|")
        cecho("\n")
    end
end

function AutomaticTable:print_header()
    if self.title then
        self:print_separator()
    else
        self:print_border(true)
    end
    if table.size(self.headers) > 0 then
        self:print_line(self.headers, self.center_headers and "center" or false)
        self:print_separator()
    end
end

function AutomaticTable:print_data()
    for row, elements in ipairs(self.data) do
        if row ~= 1 then
            if not self.skip_separators then
                self:print_separator()
            end
        end
        self:print_table_line(elements)
    end
end

function AutomaticTable:print_border(top)
    cecho(top and "/" or "\\")
    cecho(string.rep("-", self.width - 2))
    cecho(top and "\\" or "/")
    cecho("\n")
end

function AutomaticTable:print_separator()
    cecho("+")
    cecho(string.rep("-", self.width - 2))
    cecho("+")
    cecho("\n")
end

function AutomaticTable:print_line(elements, align)
    cecho("|")
    for index, value in ipairs(elements) do
        if type(value) == "table" then
            value = ""
        end
        self:do_print_line(value, self.columns[index], align)
    end
    cecho("\n")
end

function AutomaticTable:print_table_line(elements, center)
    local rows = 0
    for index, value in ipairs(elements) do
        rows = math.max(rows, table.maxn(value))
    end
    for i = 1, rows do
        cecho("|")
        for index, value in ipairs(elements) do
            center = table.index_of(self.center_columns, index) and "center" or center
            self:do_print_line(value[i] or "", self.columns[index], center)
        end
        cecho("\n")
    end
end

function AutomaticTable:do_print_line(value, width, align)
    cecho(string.rep(" ", self.padding) .. scripts.utils.str_pad(value, width, align) .. string.rep(" ", self.padding) .. "|")
end
