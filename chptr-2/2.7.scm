(define (make-interval a b)
  (cons a b))

(define (lower-bound x)
  (min (car x)
       (cdr x)))

(define (upper-bound x)
  (max (car x)
       (cdr x)))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval
  x
  (make-interval (/ 1.0 (upper-bound y))
                 (/ 1.0 (lower-bound y)))))

; (define B (make-center-percent 68.0 0.5))
; (define A (make-center-percent 50.0 0.5))
; (par1 A B)
; (par2 A A)