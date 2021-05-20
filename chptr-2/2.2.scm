(define (make-point x y) (cons x y))

(define (x-point p) (car p))

(define (y-point p) (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (make-segment x y) (cons x y))

(define (start-segment x) (car x))

(define (end-segment x) (cdr x))

(define (mid-segment seg)
  (define (average x y) (/ (+ x y) 2))
  (let ((start (start-segment seg))
        (end (end-segment seg)))
       (make-point (average (x-point start) 
                            (x-point end))
                   (average (y-point start) 
                            (y-point end)))))