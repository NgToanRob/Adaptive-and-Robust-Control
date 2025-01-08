#import "../lib.typ": *
#part_count.step() // Обновление счетчика разделов 
#show: fix-indent()

= Введение <intro> // Название и ссылка на него 
Работа №2. Принцип построения систем адаптивного и робастного управления возмущенными объектами

== Цель работы
освоение принципов построения систем адаптивного и
робастного управления на примере задачи слежения выхода скалярного
объекта за эталонным сигналом.


== Методические рекомендации.
До начала работы студенты должны
ознакомиться с анализом устойчивости нелинейных систем методом
функций Ляпунова.

== Теоретические сведения
Рассмотрим пример задачи слежения
выхода параметрически неопределенного возмущенного объекта за
эталонным сигналом. Приведем два решения поставленной задачи. При
этом воспользуемся результатами, приведенными в работе №1.

_Постановка задачи._ Дан объект, представленный моделью вида
$ dot(x) = theta x + u + delta $ <eq:object-model>
где $delta$ --- ограниченное внешнее возмущение, удовлетворяющее
неравенству $|delta(t) <= |overline(delta)|$. Как и ранее,
$x$ --- выход объекта (совпадает с переменной состояния), $u$ --- сигнал управления,
$theta$ неизвестный
постоянный параметр.

Цель управления заключается в построении закона управления,
обеспечивающего следующее целевое неравенство:
$ |x_m (t) - x(t)| <= Delta, quad quad forall t >= T, $  <eq:target>
где $Delta$, $T$ --- точность работы системы управления и время ее настройки
соответственно,
$x_m (t)$ --- эталонный сигнал, генерируемый моделью (1.2).
Предполагается, что параметры $Delta$ и $T$
можно изменять в соответствии с требованиями, предъявляемыми к системе.

Рассмотрим возможность использования в качестве решения
сформулированной задачи регулятор (1.6) и (1.9). Построим модель
ошибки $epsilon = x_m -x$:
$ dot(epsilon) = - lambda epsilon - tilde(theta) x - delta $ <eq:error-model>

Далее проведем анализ устойчивости замкнутой системы с помощью
функции Ляпунова (1.8). Учитывая последнее выражение и алгоритм
адаптации (1.9), для производной функции Ляпунова получим:
#math.equation(block: true, numbering: none)[
$ 
dot(V) &= - 1/2 2 epsilon dot(epsilon) - 1/2 2 tilde(theta) dot(tilde(theta)) \ 
&= epsilon(-lambda epsilon - tilde(theta)x - delta) - 1/gamma tilde(theta) dot(hat(theta)) \
&= -lambda epsilon^2 - tilde(theta) epsilon x - epsilon delta - tilde(theta) 1/gamma gamma x epsilon \
&= -lambda epsilon^2 - delta epsilon \
&= -lambda/2 epsilon^2 -lambda/2 epsilon^2 - delta epsilon plus.minus 1/2lambda delta^2 \
&= -lambda/2 epsilon^2 - (sqrt(lambda/2) epsilon + sqrt(1/(2lambda))delta)^2 + 1/2lambda delta^2 \
&<= -lambda/2 epsilon^2 + 1/2lambda delta^2 <= -lambda/2 epsilon^2 + 1/2lambda overline(delta)^2 
$]

Из полученного неравенства следует асимптотическое стремление ошибки $epsilon$ к некоторому ограниченному множеству, определяемому верхней
границей сигнала возмущения $overline(delta)$ и параметром $lambda$. При этом точность
системы управления может быть увеличена путем увеличения $lambda$. Однако
из приведенного анализа не следует ограниченности сигнала $hat(theta)$. Если
продолжить анализ и рассмотреть частный случай, когда переменная $x$ и
ошибка $epsilon$ стремятся к ненулевым постоянным значениям ввиду влияния
возмущения, то 
$ dot(hat(theta)) = -gamma x_"уст" epsilon_"уст" = C = "const", $
откуда следует, что 
$ hat(theta) = C t, $
и неограниченный рост оценки $hat(theta)$ с течением времени. Данное явление
получило название неограниченного параметрического дрейфа.

Таким образом, представленный регулятор (1.6) и (1.9) в общем
случае не обеспечивает ограниченность всех сигналов и не является
робастным по отношению к внешнему возмущению.

Предложенный подход не является практически применимым и
требует модификации алгоритма управления. Рассмотрим два возможных
решения.

_Решение № 1._ Представим модификацию алгоритма (1.9) в форме
$ hat(theta) = -gamma x epsilon $ <eq:adaptive-algorithm>

Подставляя @eq:adaptive-algorithm в (1.6), получаем алгоритм управления
$ u = gamma x^2 epsilon - lambda x + lambda g $ <eq:regulator>

Данный алгоритм является статическим, так как не содержит
интегральной обратной связи, и нелинейным, так как содержит член $gamma x^2 epsilon$.

Покажем, что предложенный алгоритм управления @eq:regulator гарантирует
ограниченность сигналов $epsilon$ и $hat(theta)$. Для этого выберем функцию Ляпунова
$ V = 1/2 epsilon^2 $ <eq:Lyapunov>
и рассчитаем ее производную. Учитывая @eq:regulator и модель ошибки @eq:error-model,
проведем алгебраические преобразования:
#math.equation(block: true, numbering: none)[
$
dot(V) &= 1/2 2 epsilon dot(epsilon) = -lambda epsilon^2 - tilde(theta) x epsilon - delta epsilon = -lambda/2 epsilon^2 - gamma/2 x epsilon^2 - (theta - hat(theta))x epsilon -  delta epsilon\

&= -lambda/2 epsilon^2 - lambda/2 epsilon^2 - delta epsilon plus.minus 1/lambda delta^2 - (theta + gamma x epsilon) x epsilon \

&= -lambda/2 epsilon^2 - (sqrt(lambda/2)epsilon + sqrt(1/2lambda)delta)^2 + 1/(2lambda) delta^2 plus.minus theta^2/4gamma - theta x epsilon  - gamma x^2 epsilon^2 \

&= -lambda/2 epsilon^2 - (sqrt(lambda/2)epsilon + sqrt(1/(2lambda))delta)^2 + 1/(2lambda) delta^2 - (theta/(2sqrt(gamma)) - sqrt(gamma) x epsilon)^2  + theta^2/(4gamma) \

&<= -lambda/2 epsilon^2 + 1/(2lambda) overline(delta)^2 + theta^2/(4gamma) \

&<= -lambda V + 1/(2lambda) overline(delta)^2 + theta^2/(4gamma) = -lambda V + overline(Delta) \
$
]
где $overline(Delta) = overline(delta)^2 / (2lambda) + theta^2/(4gamma)$ --- постоянная величина. Решая полученное дифференциальное неравенство, получаем:
$ V(epsilon(t)) <= e^(-lambda t) V(0) + overline(Delta)/lambda - overline(Delta)/lambda e^(-lambda t), $
откуда с учетом @eq:Lyapunov следует, что
$ 1/2 epsilon^2 <= e^(-lambda t) V(0) +  overline(Delta)/lambda - overline(Delta)/lambda e^(-lambda t) $
или
$ |epsilon(t)| <= sqrt(2(e^(-lambda t) V(0) +  overline(Delta)/lambda - overline(Delta)/lambda e^(-lambda t))) $ <eq:epsilon-bound>

_Из последнего неравенства следует экспоненциальная сходимость
ошибки управления
$epsilon$
к ограниченному множеству с границей $Delta= sqrt(2 overline(Delta)/lambda)$._ При этом величину $Delta$ можно уменьшить путем увеличения
коэффициентов $lambda$ и $gamma$. Как следствие, величина $hat(theta)$ становится
ограниченной. 

Таким образом, алгоритм управления @eq:regulator обеспечивает
устойчивость в замкнутой системе и является робастным по отношению к
внешнему возмущению. В то же время этот алгоритм имеет следующие
недостатки:
  - даже при отсутствии возмущения установившаяся ошибка
$epsilon(t)$ 
может быть отлична от нуля, что видно из неравенства @eq:epsilon-bound;
  - управление пропорционально величине $x^2$. Следовательно, при
росте
$x$
амплитуда управления возрастает квадратично, в связи с чем
практическая применимость такого закона (1.6) имеет существенные
ограничения.

Рассмотрим решение, лишенное недостатков алгоритмов (1.6), (1.9) и (1.6), @eq:adaptive-algorithm за счет наделения нового алгоритма управления адаптивными и
робастными свойствами.


_Решение № 2._ Рассмотрим совместно с настраиваемым регулятором
(1.6) алгоритм адаптации, параметрический дрейф в котором
ограничивается обратной связью по величине настраиваемого параметра:
$ dot(hat(theta)) = -sigma hat(theta) -gamma x epsilon, $ <eq:adaptive-algorithm-2>
где $sigma$ постоянная положительная величина.

Проведем анализ устойчивости замкнутой системы, представленной
объектом @eq:object-model, регулятором (1.6) и алгоритмов адаптации @eq:adaptive-algorithm-2 с помощью
функции Ляпунова (1.8). Возьмем производную от функции и проведем
ряд преобразований:
#math.equation(block: true, numbering: none)[
$
dot(V) &= 1/2 2 epsilon dot(epsilon) + 1/(2gamma) 2 tilde(theta) dot(tilde(theta)) = epsilon(-lambda epsilon - tilde(theta)x -delta) - 1/gamma tilde(theta) dot(hat(theta)) = -lambda epsilon^2 - tilde(theta) x epsilon - delta epsilon - tilde(theta)/gamma (-sigma hat(theta) - gamma x epsilon) \

&= -lambda epsilon^2 - delta epsilon + sigma/gamma tilde(theta) hat(theta) = -lambda epsilon^2 - delta epsilon + sigma/gamma tilde(theta) (-tilde(theta) + theta) = -lambda epsilon^2 - delta epsilon - sigma/gamma tilde(theta)^2 + sigma/gamma tilde(theta) theta \
 
&= -lambda/2 epsilon^2 -lambda/2 epsilon^2 - delta epsilon plus.minus 1/(2lambda) delta^2 - sigma/(2gamma) tilde(theta)^2 - sigma/(2gamma) tilde(theta)^2 + sigma/gamma tilde(theta) theta plus.minus sigma/(2gamma) theta^2 \

&= -lambda/2 epsilon^2 - sigma/(2gamma) tilde(theta)^2 - (sqrt(lambda/2) epsilon + sqrt(1/(2lambda)) delta)^2  - sigma/gamma (sqrt(1/2) tilde(theta) - sqrt(1/2) theta)^2 + 1/(2lambda) delta^2 + sigma/(2gamma) theta^2 \

&<= -lambda/2 epsilon^2 - sigma/(2gamma) tilde(theta)^2 + 1/(2lambda) delta^2 + sigma/(2gamma) theta^2 =  -lambda/2 epsilon^2 - sigma/(2gamma) tilde(theta)^2 + 1/(2lambda) overline(delta)^2 + sigma/(2gamma) theta^2\
$
]

Введем обозначение $kappa=min{lambda, sigma}$. Тогда, считая $lambda$, $sigma$ положительными, имеем:
#math.equation(block: true, numbering: none)[
$ dot(V) <= -kappa (1/2 epsilon^2 - 1/(2gamma) tilde(theta)^2) + 1/(2lambda) overline(delta)^2 + sigma/(2gamma) theta^2 $
]
или
#math.equation(block: true, numbering: none)[
$ dot(V) <= kappa V + overline(Delta) $
]
где $overline(Delta) = overline(delta)^2/(2lambda) + sigma theta^2 / (2gamma)$ ---  постоянная величина. Далее, решая данное
дифференциальное неравенство, получаем:
#math.equation(block: true, numbering: none)[
$ V(epsilon(t)) <= e^(kappa t)V(0) + overline(Delta)/kappa - overline(Delta)/kappa e^(kappa t)V(0) $
]

откуда следует, что
#math.equation(block: true, numbering: none)[
  $ |epsilon(t)| <= sqrt(2(e^(kappa t)V(0) + overline(Delta)/kappa - overline(Delta)/kappa e^(kappa t)V(0) )) $ 
]

_Из последнего неравенства следует экспоненциальная сходимость
ошибки управления к ограниченному множеству с границей $Delta=sqrt(2 overline(Delta)/kappa)$_

Алгоритм управления (1.6), основанный на алгоритме адаптации
@eq:adaptive-algorithm-2, также обеспечивает устойчивость замкнутой системы и является
робастным по отношению к внешнему возмущению. В то же время
алгоритм (1.6), @eq:adaptive-algorithm-2 позволяет парировать недостатки робастного
алгоритма управления @eq:regulator. Так, при отсутствии внешнего возмущения
или при его несущественном влиянии верхняя граница $overline(Delta)$ может быть
снижена до нуля за счет обнуления коэффициента $sigma$ (т.н. гибридная $sigma$ -- модификация). Кроме того, для уменьшения $Delta$ нет необходимости в
значительном увеличении $gamma$, которое влечет за собой рост амплитуды
управляющего воздействия. Снижение $Delta$ можно обеспечить путем
уменьшения коэффициента $sigma$.