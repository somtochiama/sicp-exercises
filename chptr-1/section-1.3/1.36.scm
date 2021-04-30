(define (average x y) (/ (+ x y) 2))



(define (fixed-point-damped f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
        tolerance))
  (define (try guess)
    (let ((next (average (f guess) guess)))
         (display next)
         (newline)
         (if (close-enough? guess next)
             next
             (try next))))
(try first-guess))

; This took 34 steps
(fixed-point-damped (lambda (x) (/ (log 1000) (log x))) 2)