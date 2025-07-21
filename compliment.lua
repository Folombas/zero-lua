os.execute("chcp 65001 > nul") -- Фикс кодировки для Windows

-- Инициализируем генератор случайных чисел
math.randomseed(os.time()) -- Ключевое исправление!

local compliment_sets = {
    technical = {
        "Твой код читается как поэзия!",
        "Ты мастер алгоритмов!",
        "Твой код - это песня!",
        "Твой код - это музыка!",
        "Ты пишешь крутой код!"
    },
    personal = {
        "Твоё чувство юмора восхищает!",
        "С тобой приятно работать!"
    }
}

-- Выбор случайной категории
local set_names = {}
for name in pairs(compliment_sets) do
    table.insert(set_names, name)
end

math.randomseed(os.time())
local random_set = compliment_sets[set_names[math.random(1, #set_names)]]
print(random_set[math.random(1, #random_set)])
