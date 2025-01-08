#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

= Выводы
Для первого задания, когда $g=0$: моделирование эквивалентно управлению системой к состоянию 0. При увеличении значения $gamma$ система стабилизируется быстрее, но перерегулирование будет выше.

Для второго задания: мы осуществляем управление системой, следуя эталонной модели. При увеличении значения $gamma$ значение $Psi_p$ стабилизируется быстрее, но ошибка между $y$ и $y_M$ увеличивается, и управляющий сигнал также возрастает.