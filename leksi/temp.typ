Object
$ dot(x) = theta x + u $
Reference:
$ dot(x_M)  = -lambda x_m + lambda g $

Error:
$ epsilon = x_M - x $
$ 
dot(epsilon) = dot(x_M) - dot(x)\
   = -lambda x_m + lambda g - theta x - u\
$

Exponetial Stability:
$ 
dot(epsilon) = -lambda epsilon\
    -lambda x_m + lambda g - theta x - u = -lambda epsilon \
    u = -lambda (epsilon - x_M) + lambda g - theta x\
    u = - lambda x + lambda g - theta x\
$

Adaptive:
$ u = -hat(theta) x - lambda x +lambda g $

Thay vao Object:
$ 
dot(x) = theta x   -hat(theta) x - lambda x +lambda g\
= tilde(theta) x - lambda x + lambda g\ 
 $

 Thay vao Error:
$
dot(epsilon) = dot(x_M) - dot(x)\
= -lambda x_m + lambda g - tilde(theta) x + lambda x - lambda g\
= -lambda epsilon - tilde(theta) x\
$ 

Lyapunov:
$
V = 1/2 epsilon^2 + 1/2 tilde(theta)^2
$

