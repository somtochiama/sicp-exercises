(load "rat.scm")

(define (make-rat n d)
  (define sign 
    (if (> (* n d)0)
        +
        -))
  (let ((g (gcd n d)))
    (cons (sign (/ (abs n) g)) (/ (abs d) g))))

