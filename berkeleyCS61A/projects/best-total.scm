(load "common.scm")

(define (first-part card) (bl card))

(define (add-ace total num)
  (define (iter num-11 num-1)
    (let ((new-total (+ total (* 11 num-11) (* 1 num-1))))
      (if (or (<= new-total 21) (<= num-11 0))
        new-total
        (iter (- num-11 1) (+ num-1 1)))))
  (iter num 0))

(define (card-ace? value)
  (or (equal? value 'A) (equal? value 'a)))

(define (card-picture? value)
  (contains? '(j q k J Q K) value))

(define (best-total cards)
  (define (iter left total num-a)
    (if (empty? left)
        (add-ace total num-a)
        (let ((point (first-part (first left))))
          (cond ((card-ace? point) (iter (bf left) total (+ num-a 1)))
                ((card-picture? point) 
                 (iter (bf left) (+ total 10) num-a))
                ((number? point) (iter (bf left)
                            (+ point total) num-a))
                (else (error point "not a number or one of the letters J Q K A"))))))
  (iter cards 0 0))
