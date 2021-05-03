(define (iterative-improve good-enough? f)
  (define (next guess) 
    (if (good-enough? guess) 
        guess
        (next (f guess))))
  next)

(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))


(define (sqrt x)
    (define (good-enough? y)
      (< (abs (- x (square y))) 0.00001))
    (define (improve guess)
      (average guess (/ x guess)))
    ((iterative-improve good-enough? improve) 1.0))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1)
    (< (abs (- v1 (f v1))) tolerance))
  ((iterative-improve close-enough? f) first-guess))