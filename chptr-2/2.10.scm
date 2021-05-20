(define (div-interval x y)
  (if (or (= (upper-bound y) 0)
          (= (lower-bound y) 0))
      (error "cannot divide by zero. Please check bounds")
      (mul-interval
      x
      (make-interval (/ 1.0 (upper-bound y))
                      (/ 1.0 (lower-bound y))))))