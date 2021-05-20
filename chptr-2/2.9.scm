(define (width-interval x)
  (/ (- (upper-bound x)
        (lower-bound x)) 
      2))

(define a (make-interval 5 8))
(define b (make-interval 7 10))

(equal? (width-interval (add-interval a b)) 
        (+ (width-interval a) (width-interval b)))

(equal? (width-interval (sub-interval a b)) 
        (- (width-interval a) (width-interval b)))

(equal? (width-interval (mul-interval a b)) 
        (* (width-interval a) (width-interval b)))

(equal? (width-interval (div-interval a b)) 
        (/ (width-interval a) (width-interval b)))