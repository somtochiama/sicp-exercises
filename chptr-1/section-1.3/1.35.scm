; (a). Expeanding the equation 1 + 1/x =x gives x^2 - x - 1 = 0
;  Using Almighty formular, you get the roots (1 + sqrt(5)) / 2 and (1 - sqrt(5)) / 2
; (1 + sqrt(5)) / 2 is the golden ratio
; Therefore, the golden ratio is a fixed point of the transformation x -> 1 + 1/x

(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
        tolerance))
  (define (try guess)
    (let ((next (f guess)))
         (if (close-enough? guess next)
             next
             (try next))))
(try first-guess))

(define (golden-ratio) 
   (fixed-point (lambda (x) (+ 1 (/ 1 x)))
                1.0))