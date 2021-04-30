(define (cont-frac n d k)
   (define (iter x)
      (if (> x k)
          0
          (/ (n x) 
             (+ (d x) 
                (iter (+ x 1))))))
    (iter 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           12)
; k = 12 to get an approximation of (1 / golden ratio) that is accurate to 2 decimal places

(define (cont-frac-iter n d k)
  (define (iter denum x)
    (if (= x 1)
        (/ (n 1) denum)
        (iter (+ (d (- x 1))
                 (/ (n x) denum)) 
              (- x 1))))
  (iter (d k) k))

