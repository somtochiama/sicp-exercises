(define zero
  (lambda (f) (lambda (x) x)))

(define one 
  (lambda (f) (lambda (x) (f x))))

(define two 
  (lambda (f) (lambda (x) (f (f x)))))

(define (+ a b)
  (lambda (f) 
    (lamba (x) ((a f) ((b f) x)))))