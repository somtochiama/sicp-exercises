(define (stop-at n)
  (lambda (cards dealer-hand)
      (< (best-total cards) n)))

(define stop-at-17 (stop-at 17))
