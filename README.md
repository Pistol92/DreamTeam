Переменные
  Player1...11(t) - значение очков Castrol для игроков нашей команды, которых мы можем продавать, в момент t
  DreamPlayer1...5(t) - значение очков Castrol для целевых игроков в момент t
  MeanPlayer1...11(t) - среднее значение очков Castrol за год от момента t для игроков нашей команды, которых мы можем продавать
  MeanDreamPlayer1...11(t) - среднее значение очков Castrol за год от момента t для целевых игроков
  
  mu1...11 - начальное среднее значение очков Castrol за год для игроков нашей команды, которых мы можем продавать
  mu12...16 - начальное среднее значение очков Castrol за год для целевых игроков
  sigma1...11 - начальное СКО очков Castrol за год для игроков нашей команды, которых мы можем продавать
  sigma12...16 - начальное СКО очков Castrol за год для целевых игроков
  muoverall - начальное среднее значение очков Castrol за год по всей выборке
  sigmaoverall - начальное СКО очков Castrol за год по всей выборке
  Z - стандартная нормально распределённая величина
  
  Value1...11(t) - ценность наших игроков в евро в момент t
  DreamValue1...5(t) - ценность целевых игроков в евро в момент t
  
  MarketValue(t) - рыночная ценность нашего клуба в момент t
  Сontract1...11 - количество лет до истечения контракта нашего игрока с клубом
  DreamContract1...5 - количество лет до истечения контракта целевого игрока с другим клубом
  
  Time - время (в годах)
  Divisions - на сколько делим t
  Deltat = 1/Divisions
  
  Budget(t) - годовой бюджет, выделенный на трансферы
  TransferCosts(t) - часть Budget(t), действительно потраченная на трансферы
  Salary1...11(t) = 3200000 евро в год - зарплата нашего игрока
  Salary12...16 = 6200000 евро в год - зарплата целевого игрока
  MeanSalary = 3000000 евро в год - зарплата среднего игрока
  Costs(t) - затраты клуба на момент t
  
  OurDreamPlayer(t) - сколько целевых игроков есть в момент t в нашей команде
  
  Runs - количество симуляций
  
  Rf - безрисковая ставка доходности
  
Формулы
 Player1...11(t+1)=Player1...11(t)*Exp(mu1...11 * deltat + Z * sigma1...11 * (deltat^0.5)) - геометрическое Броуновское движение для наших игроков
 DreamPlayer1...5(t+1)=DreamPlayer1...11(t)*Exp(mu12...16 * deltat + Z * sigma12...16 * (deltat^0.5)) - геометрическое Броуновское движение для целевых игроков
 MeanPlayer(t+1)=MeanPlayer(t)*Exp(muoverall * deltat + Z * sigmaoverall * (deltat^0.5)) - геометрическое Броуновское движение для среднего игрока
 
 Value1...11 = 3666.159737 * MeanPlayer1...11(t) ^ 0.2313 * MarketValue(t) ^ 1.0571 * 1.020724 ^ Сontract1...11(t) * e - формула для определения рыночной ценности наших игроков
 'Аналогично для целевых и средних игроков

Ограничения
  Costs(t) = Value1...11(t) + Salary1...11 - DreamValue1...5(t) - Salary12...16 - TransferCosts(t) - MeanValue(t) - MeanSalary
  'Переменные Value, Salary, DreamValue, TransferCosts, MeanValue, MeanSalary отличны от нуля только если в данном периоде осуществляется продажа или покупка игроков
  Costs(t) + Costs(t+1) + Costs(t+2) < 30000000 евро
  Budget(t) = x (можно прогнать с разным бюджетом и таким образом провести анализ чувствительности)
  
Что делает модель
  1) Задаёт ограничения: Costs, Budget
  2) Моделирует количество очков Castrol для наших и целевых игроков
  3) Рассчитывает трансферную ценность для наших и целевых игроков
  4) Принимает решения о покупке и продаже наших, целевых и средних игроков
  5) Считает, сколько целевых игроков удалось купить
  6) По приобретении всех игроков замеряет время и переводит в гистограмму
 
