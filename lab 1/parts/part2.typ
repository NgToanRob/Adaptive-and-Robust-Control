#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

== Построение адаптивной СУ <ch2:sec1>
Синтезировать алгоритм адаптации @eq:adaptive_algorithm и подключить его к
настраиваемому регулятору @eq:regulator. Повторить эксперимент для адаптивной
системы управления, замкнутой регулятором @eq:regulator с алгоритмом адаптации
@eq:adaptive_algorithm с $hat(theta)(0)=0$
. Коэффициент адаптации
$gamma$
выбрать экспериментально.
Дополнительно построить график параметрической ошибки
$tilde(theta)=theta-hat(theta)$
.


Положим теперь, что параметр $theta$ неизвестен. Алгоритм @eq:adaptive_algorithm называется алгоритмом адаптации. Используя данный алгоритм и закон @eq:dot_epsilon можем составить схему моделирования адаптивной системы с регулятором.

Как и ранее, исследуется скачкообразное изменение параметра $theta$. Ниже приведены графики результаты моделирования.


#figure(
  image("../matlab/images/task_2_simulink.png", width: 90%),
  caption: "Структурная схема моделирования системы."
)

#pagebreak()

1. При $gamma=3$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_2_x.png", width: 95%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m(t)$.]
    )
  ],
  [
    #figure(
    image("../matlab/images/task_2_u.png", width: 95%),
    caption: [График изменения управляющего воздействия $u(t)$.]
    )
    
  ]
)

#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_2_e.png", width: 95%),
      caption: [График изменения ошибки $epsilon(t)$.]
      
    )
  ],
  [
    #figure(
      image("../matlab/images/task_2_theta_e.png", width: 94%),
      caption: [График изменения ошибки $tilde(theta)(t)$.]
    )
  ]
)

#pagebreak()
2. При $gamma=10$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_3_x_gamma_10.png", width: 94%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m(t)$.]
    )
  ],
  [
    #figure(
    image("../matlab/images/task_3_u_gamma_10.png", width: 95%),
    caption: [График изменения управляющего воздействия $u(t)$.]
    )
    
  ]
)

#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_3_e_gamma_10.png", width: 95%),
      caption: [График изменения ошибки $epsilon(t)$.]
      
    )
  ],
  [
    #figure(
      image("../matlab/images/task_3_theta_e_gamma_10.png", width: 95%),
      caption: [График изменения ошибки $tilde(theta)(t)$.]
    )
  ]
)


#pagebreak()
3. При $gamma=30$:
#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_3_x_gamma_30.png", width: 94%),
      caption: [График изменения выходной переменной $x(t)$ и эталонной модели $x_m(t)$.]
    )
  ],
  [
    #figure(
    image("../matlab/images/task_3_u_gamma_30.png", width: 95%),
    caption: [График изменения управляющего воздействия $u(t)$.]
    )
    
  ]
)

#grid(
  columns: 2,
  [
    #figure(
      image("../matlab/images/task_3_e_gamma_30.png", width: 95%),
      caption: [График изменения ошибки $epsilon(t)$.]
      
    )
  ],
  [
    #figure(
      image("../matlab/images/task_3_theta_e_gamma_30.png", width: 95%),
      caption: [График изменения ошибки $tilde(theta)(t)$.]
    )
  ]
)



