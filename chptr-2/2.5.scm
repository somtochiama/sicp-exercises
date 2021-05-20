(define (cons a b)
  (* (expt 2 a) 
     (expt 3 b)))

(define (get-expt n x)
  (define (iter a b)
    (if (not (= (remainder a x) 0))
        b
        (iter (/ a x) (+ b 1))))
  (iter n 0))

(define (car c)
  (get-expt c 2))

(define (cdr c)
  (get-expt c 3))