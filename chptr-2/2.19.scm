(define (except-first-denomination coin-val)
  (cdr coin-val))

(define (first-denomination coin-val)
  (car coin-val))

(define (no-more? coin-val)
  (null? coin-val))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
          (+ (cc amount
                 (except-first-denomination
                  coin-values))
             (cc (- amount
                    (first-denomination
                     coin-values))
                 coin-values)))))

; The order of the coins doesn't matter
; Because regardless of the order, the same change will still be gotten
; regardless of which currency you start with.