(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
(iter items nil))

; This is because it adds the square of the next item to the back of the list
; e.g (iter '(1 2 3 4) '())
; gives -> (iter '(2 3 4) (1)
; which gives -> (iter '(2 3 4) '(4 1))
; etcetera

(define (square-list items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
              (sqr (car things))))))
  (iter items nil))

; Swapping it gives
; e.g (iter '(1 2 3 4) '(nil 1))
; gives -> (iter '(2 3 4) '('(nil 1) 4) etc