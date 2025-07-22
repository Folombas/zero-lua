-- Устанавливаем кодировку UTF-8 для корректного отображения
os.execute("chcp 65001 > nul 2>&1")
io.output():setvbuf('no') -- Отключаем буферизацию вывода

-- Функция для точной задержки
local function delay(seconds)
    local start = os.clock()
    while os.clock() - start < seconds do end
end

-- Очистка экрана
local function clear_screen()
    if package.config:sub(1, 1) == "\\" then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

-- Анимированный вывод текста
local function animated_print(text, char_delay)
    for i = 1, #text do
        io.write(text:sub(i, i))
        io.flush()
        delay(char_delay)
    end
    print()
end

-- Плавное стирание экрана
local function fade_clear(lines, line_delay)
    for i = lines, 1, -1 do
        -- Перемещаем курсор на нужную строку
        io.write(string.format("\27[%d;1H", i))
        -- Затираем строку пробелами
        io.write(string.rep(" ", 100))
        io.flush()
        delay(line_delay)
    end
    -- Возвращаем курсор в начало
    io.write("\27[1;1H")
    -- Очищаем экран полностью
    clear_screen()
end

-- Анимация спиннера
local function spinner_animation(duration, message)
    local frames = { "-", "\\", "|", "/" }
    local start_time = os.clock()
    local frame_index = 1

    io.write(message .. " ")
    io.flush()

    while os.clock() - start_time < duration do
        io.write("\r" .. message .. " " .. frames[frame_index])
        io.flush()

        frame_index = frame_index % #frames + 1
        delay(0.1)
    end

    io.write("\r" .. message .. " ✓\n")
end

-- Основная программа
clear_screen()
print("Запуск программы...")
delay(0.5)

spinner_animation(1.5, "Инициализация анимации")

print("\n")
animated_print("Hello, Lua World!", 0.07)

-- Финальное сообщение
print("\nДополнительные эффекты:")
print("[✓] Программа успешно завершена!")

-- Ждем 2 секунды перед стиранием
delay(2)

-- Плавно стираем весь текст с экрана
fade_clear(10, 0.1)

-- Ждем на пустом экране
delay(1)

-- Выводим финальное сообщение
print("The end of program")
delay(1)
