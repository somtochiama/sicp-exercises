(define (smooth f)
  (define (average x y z) (/ (+ x y z) 3))
  (lambda (x) (average (f (- x dx))
                       (f x)
                       (f (+ x dx)))))

(define (n-fold-smooth f n)
  (repeated (smooth f) n))