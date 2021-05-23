(define (square-list items)
  (if (null? items)
      nil
      (cons (sqr (car items)) (square-list (cdr items)))))

(define (square-list-two items)
(map (lambda (x) (* x x)) items))