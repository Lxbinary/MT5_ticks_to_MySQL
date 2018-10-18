# MT5_ticks_to_MySQL
Сбор тиков из MetaTrader 5 в MySQL напрямую в базу через libmysql #MQL5 #MT5 #MySQL

Настройки:
<p align="center">
  <img src="https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/setup.png" width="400"/>
</p>

<b>Из фитчей</b>: 
если поле Список инструментов оставить пустым, то будут собираться тики со всех инструментов из Обзора Рынка


<p align="center">
  <img src="https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/mt_log.png" width="600"/>
</p>


в ms указано потраченое время на запись в базу

После коннекта к базе советник сам создает нужные таблицы под каждую пару

![Иллюстрация к проекту](https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/bd1.png)

![Иллюстрация к проекту](https://github.com/Lxbinary/MT5_ticks_to_MySQL/raw/master/image/bd2.png)
