(define (reckless strategy)
  (lambda (cards hand)
    (and (not (empty? card)) (strategy (bl card) hand))))
