# MT5_ticks_to_MySQL
Сбор тиков из MetaTrader 5 в MySQL напрямую в базу через libmysql в реалтайме
#MQL5 #MT5 #MySQL

<h4>Установка:</h4>
<p> - копируем содержимое в папку MQL терминала</p> 
<p> - разрешаем dll в настройках терминала </p>
<p> - устанавливаем, настраиваем MySQL и создаем базу под тики </p>

<h4>Настройки:</h4>
Из фитчей: 
если поле Список инструментов оставить пустым, то будут собираться тики со всех инструментов из Обзора Рынка
<p align="center">
  <img src="https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/setup.png" width="400"/>
</p>

<h4>Print лога работы:</h4>
<p align="center">
  <img src="https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/mt_log.png" width="600"/>
</p>

в ms указано потраченое время на запись в базу

После коннекта к базе советник сам создает нужные таблицы под каждую пару

<p align="center">
  <img src="https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/bd1.png" width="600"/>
</p>

<p align="center">
  <img src="https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/bd2.png" width="600"/>
</p>

<b>ВНИМАНИЕ:</b>
К сожалению либа работает только в синхронном режиме, чтоб все работало быстрее и не создавалось лага - рекомендую запускать несколько терминалов, в идеале, под каждую пару отдельный терминал.
