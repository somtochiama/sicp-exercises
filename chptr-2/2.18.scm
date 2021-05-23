(define (reverse arr)
  (if (null? arr)
      '()
      (append (reverse (cdr arr)) (list (car arr)))))

; more efficient because it doesn't use append
(define (reverse-two arr)
  (define (iter left right)
    (if (null? left)
        right
        (iter (cdr left) (cons (car left) right))))
  (iter arr '()))