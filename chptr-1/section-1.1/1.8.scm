(define (square x) (* x x))
(define (cube x) (* x x x))

(define (new-good-enough? guess next-guess)
  (< (abs (- guess next-guess)) 0.00000000001))

(define (good-enough? guess x)
  (< (abs (- (cube guess) x)) 0.000000001))

(define (improve-cbrt guess x)
  (/ (+ (/ x (square guess)) 
        (* 2 guess)) 
      3))

(define (cubert-iter guess x)
  (if (new-good-enough? guess (improve-cbrt guess x))
        guess
        (cubert-iter (improve-cbrt guess x) x)))