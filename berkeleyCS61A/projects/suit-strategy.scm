(load "common.scm")

(define (suit-strategy suit include-strategy not-include-strategy)
  (lambda (cards hand)
    (if (has-card? cards suit)
        (include-strategy cards hand)
        (not-include-strategy cards hand))))
