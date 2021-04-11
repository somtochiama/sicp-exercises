(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (new-good-enough? guess next-guess)
  (< (abs (- guess next-guess)) 0.000000001))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (define next-guess (improve guess x))
  (if (new-good-enough? guess next-guess)
        guess
        (sqrt-iter next-guess x)))