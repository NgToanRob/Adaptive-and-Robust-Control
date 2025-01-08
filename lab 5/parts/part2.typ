#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Задание 2 <ch2:sec1>

На основе эталонной модели (7.5), фильтров (7.2), (7.3),
настраиваемого регулятора (7.8), алгоритма адаптации (8.4) и данных,
представленных в Таблице 8.1, построить следящий адаптивный
регулятор. 

Провести моделирование для трех различных коэффициентов $gamma$. По
результатам моделирования построить три графика моделирования. На
первом графике отобразить выходную переменную $y$ и ее желаемое 
значение $y_M$, на втором графике -- управляющее воздействие $u$
, на третьем -- оценки параметров $hat(Psi)_p$.

Результаты экспериментов:
1. Удерживая $gamma_2 = 0.05$
#figure(
  image("../matlab/images/task_2_gamma_0_05_y_y_m.png", width: 90%),
  caption: [График выходной переменной $y$ и желаемого значения $y_M$ при $gamma = 0.05$]
)

#figure(
  image("../matlab/images/task_2_gamma_0_05_u.png", width: 90%),
  caption: [График управляющего воздействия $u$ при $gamma = 0.05$]
)

#figure(
  image("../matlab/images/task_2_gamma_0_05_psi_p.png", width: 90%),
  caption: [График оценки параметров $hat(Psi)_p$ при $gamma = 0.05$]
)

2. Удерживая $gamma_2 = 0.1$
#figure(
  image("../matlab/images/task_2_gamma_0_1_y_y_m.png", width: 90%),
  caption: [График выходной переменной $y$ и желаемого значения $y_M$ при $gamma = 0.5$]
)

#figure(
  image("../matlab/images/task_2_gamma_0_1_u.png", width: 90%),
  caption: [График управляющего воздействия $u$ при $gamma = 0.1$]
)

#figure(
  image("../matlab/images/task_2_gamma_0_1_psi_p.png", width: 90%),
  caption: [График оценки параметров $hat(Psi)_p$ при $gamma = 0.1$]
)

3. Удерживая $gamma_2 = 0.5$
#figure(
  image("../matlab/images/task_2_gamma_0_5_y_y_m.png", width: 90%),
  caption: [График выходной переменной $y$ и желаемого значения $y_M$ при $gamma = 0.5$]
)

#figure(
  image("../matlab/images/task_2_gamma_0_5_u.png", width: 90%),
  caption: [График управляющего воздействия $u$ при $gamma = 0.5$]
)

#figure(
  image("../matlab/images/task_2_gamma_0_5_psi_p.png", width: 90%),
  caption: [График оценки параметров $hat(Psi)_p$ при $gamma = 0.5$]
)
