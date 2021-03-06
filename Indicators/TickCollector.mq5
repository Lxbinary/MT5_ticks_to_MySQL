//+------------------------------------------------------------------+
//|                                                TickCollector.mq5 |
//|                                                        avoitenko |
//|                        https://login.mql5.com/en/users/avoitenko |
//+------------------------------------------------------------------+
#property copyright  "avoitenko"
#property link       "https://login.mql5.com/en/users/avoitenko"
#property version    "1.00"
//---
#property description "Индикатор для сбора тиков"
#property description "Генерирует пользовательское событие \"Новый тик\" для графика - получателя события"
//---
#property indicator_chart_window
#property indicator_buffers  0
#property indicator_plots 0
//---
#define CHARTEVENT_INIT 0x0   // Событие "инициализация"
#define CHARTEVENT_TICK 0x1   // Событие "новый тик"
#define SEP             ";"   // разделитель
//---
input long   chart_id=0;      // идентификатор графика-получателя события
input ushort custom_event_id=0;// идентификатор события
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
/*
//--- проверка, для тестера OnChartEvent не работает
   if(MQLInfoInteger(MQL_TESTER))
     {
      Print("Индикатор '",MQLInfoString(MQL_PROGRAM_NAME),"' не работает в тестере");
      return(INIT_FAILED);
     }
*/
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   MqlTick tick;
   SymbolInfoTick(_Symbol,tick);

   long vol_m1[1];
   CopyTickVolume(_Symbol,PERIOD_M1,0,1,vol_m1);

//--- формируем строку вида: Symbol, (long)DateTime, (long)DateTime_msec, Bid, Ask, Last, (int)Flags, (int)Volume
   string sparam=_Symbol+SEP
                 +(string)tick.time+SEP
                 +(string)tick.time_msc+SEP
                 +DoubleToString(tick.bid,_Digits)+SEP
                 +DoubleToString(tick.ask,_Digits)+SEP
                 +DoubleToString(tick.last,_Digits)+SEP
                 +(string)tick.flags+SEP
                 +(string)vol_m1[0]+SEP
                 +(string)tick_volume[rates_total-1]+SEP
                 +(string)_Digits+SEP
                 +(string)GetMicrosecondCount();

   if(prev_calculated==0)
     {
      //--- событие инициализации CHARTEVENT_INIT
      EventChartCustom(chart_id,custom_event_id,CHARTEVENT_INIT,tick.bid,sparam);
      return(rates_total);
     }

//--- событие новый тик CHARTEVENT_TICK
   EventChartCustom(chart_id,custom_event_id,CHARTEVENT_TICK,tick.bid,sparam);

   return(rates_total);
  }
//+------------------------------------------------------------------+
