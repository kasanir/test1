-- Параметры источника данных
CLASS_CODE  = "SPBFUT";     -- Класс бумаги
SEC_CODE = "RIH7";          -- Код бумаги
TIME_FRAME = INTERVAL_M1;   -- Таймфрейм
-- Параметры стратегии
LotsLong   = 1;       -- Количество лотов для входа в лонг
LotsShort   = 1;      -- Количество лотов для входа в шорт
TimeStart  = 0;       -- Время начала работы стратегии
TimeFinish  = 0;      -- Время окончания работы стратегии
MinutesBuild  = 100;  -- Количество минут построения коробки
MinutesTrade  = 80;   -- Количество минут поиска входа
MinHight  = 300;      -- Минимальная высота коробки
Trailing  = 500;      -- Размер трейлинг-стопа
StopLoss  = 50;       -- Размер стоп-лосса
-- Остальные переменные скрипта
DS = nil; -- источник данных (DataSource)

-- Поиск в таблице lua
--   TBL - таблица для поиска
--  FUNC - функция сравнения с одним параметром, в который передается значение элемента таблицы. Должна возвращать true в случае совпадения
--  Возвращает ключ и значение первого найденного результата (или nil/nil при неудаче)
function table_find(tbl,func)    
  for key,value in pairs(tbl) do        
    if func(value) then
      return key,value
    end    
  end
end

function LoadFromFile(fileName)  
  local file = io.open(fileName, "r")  
  if file ~= nil then    
    value = file:read()    
    file:close()    
    if value ~= nil then      
      return value    
    end  
  end  
  return ""
end

function WriteInFile(fileName, text)  
  local file = io.open(fileName, "w+t")  
  if file ~= nil then    
    file:write(text)    
    file:close()  
  end
end

function AppendInFile(fileName, text)  
  local file = io.open(fileName, "a")  
  if file ~= nil then    
    file:write(text)    
    file:close()  
  end
end

-- функция подключения к источнику данных для замены 
function ConnectData() 
  --res = CreateDataSource(CLASS_CODE, SEC_CODE, TIME_FRAME); 
  local f = io.open(getScriptPath().."//data.txt","r");    
  if f ~= nil then 
    -- Если файл существует, перебирает строки файла, считывает содержимое в соответствующие переменные  
    local Count = 0; -- Счетчик строк  
    for line in f:lines() do   
      Count = Count + 1;     
    end; 
  end; 
  return res;
end;

-- Параметры источника данных
CLASS_CODE  = "SPBFUT";     -- Класс бумаги
SEC_CODE = "RIH7";          -- Код бумаги
TIME_FRAME = INTERVAL_M1;   -- Таймфрейм
-- Параметры стратегии
LotsLong   = 1;       -- Количество лотов для входа в лонг
LotsShort   = 1;      -- Количество лотов для входа в шорт
TimeStart  = 0;       -- Время начала работы стратегии
TimeFinish  = 0;      -- Время окончания работы стратегии
MinutesBuild  = 100;  -- Количество минут построения коробки
MinutesTrade  = 80;   -- Количество минут поиска входа
MinHight  = 300;      -- Минимальная высота коробки
Trailing  = 500;      -- Размер трейлинг-стопа
StopLoss  = 500;      -- Размер стоп-лосса
-- Остальные переменные скрипта
DS = nil; -- источник данных (DataSource)

-- Поиск в таблице lua
--   TBL - таблица для поиска
--  FUNC - функция сравнения с одним параметром, в который передается значение элемента таблицы. Должна возвращать true в случае совпадения
--  Возвращает ключ и значение первого найденного результата (или nil/nil при неудаче)
function table_find(tbl,func)    
  for key,value in pairs(tbl) do        
    if func(value) then
      return key,value
    end    
  end
end

function LoadFromFile(fileName)  
  local file = io.open(fileName, "r")  
  if file ~= nil then    
    value = file:read()    
    file:close()    
    if value ~= nil then      
      return value    
    end  
  end  
  return ""
end

function WriteInFile(fileName, text)  
  local file = io.open(fileName, "w+t")  
  if file ~= nil then    
    file:write(text)    
    file:close()  
  end
end

function AppendInFile(fileName, text)  
  local file = io.open(fileName, "a")  
  if file ~= nil then    
    file:write(text)    
    file:close()  
  end
end

-- функция подключения к источнику данных для замены 
function ConnectData() 
  --res = CreateDataSource(CLASS_CODE, SEC_CODE, TIME_FRAME); 
  local f = io.open(getScriptPath().."//data.txt","r");    
  if f ~= nil then 
    -- Если файл существует, перебирает строки файла, считывает содержимое в соответствующие переменные  
    local Count = 0; -- Счетчик строк  
    for line in f:lines() do   
      Count = Count + 1;     
    end; 
  end; 
  return res;
end;

-- При инициализации скрипта подключаемся к графику выбранного таймфрейма
function OnInit() 
  -- Подключается к источнику данных (графику) 
  DS = ConnectData(); 
  -- Вычисляет время открытия следующего бара 
  NextBarSeconds = os.time(DS:T(DS:Size())) + TIME_FRAME * 60; 
  -- Закрывает источник данных 
  DS:Close(); 
  -- открываем файл для записи сделок в режиме "чтения/записи" 
  local f = io.open(getScriptPath().."//deals.txt","r+");
end;

function main() 
  -- Функция, реализующая основной поток выполнения в скрипте 
  while IsRun do 
    -- Цикл будет выполнятся, пока IsRun == true   
  end;
end;
