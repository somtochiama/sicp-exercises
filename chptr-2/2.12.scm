(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (make-center-percent c percent)
  (let ((width (* c (/ percent 100))))
    (make-center-width c width)))

(define (percent i)
  (/ (* 100 (width i)) (center i)))